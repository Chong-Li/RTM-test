package benchmark

import (
	"encoding/binary"
	"log"
	"sync"
	"time"
	"io/ioutil"
	"strconv"
)

type MessageReceiver interface {
	MessageHandler() *MessageHandler
	Setup()
	Teardown()
}

type ReceiveEndpoint struct {
	MessageReceiver  MessageReceiver
	NumberOfMessages int
	Handler          *MessageHandler
}

func NewReceiveEndpoint(receiver MessageReceiver, numberOfMessages int) *ReceiveEndpoint {
	return &ReceiveEndpoint{
		MessageReceiver:  receiver,
		NumberOfMessages: numberOfMessages,
		Handler:          receiver.MessageHandler(),
	}
}

type MessageHandler interface {
	// Process a received message. Return true if it's the last message, otherwise
	// return false.
	ReceiveMessage([]byte) bool

	// Indicate whether the handler has been marked complete, meaning all messages
	// have been received.
	HasCompleted() bool
}

type ThroughputMessageHandler struct {
	hasStarted       bool
	hasCompleted     bool
	messageCounter   int
	NumberOfMessages int
	started          int64
	stopped          int64
	completionLock   sync.Mutex
}

type LatencyMessageHandler struct {
	NumberOfMessages int
	Latencies        []float32
	messageCounter   int
	hasCompleted     bool
	Channel		string
	Results		[]byte
	completionLock   sync.Mutex
}

func (handler *ThroughputMessageHandler) HasCompleted() bool {
	handler.completionLock.Lock()
	defer handler.completionLock.Unlock()
	return handler.hasCompleted
}

// Increment a message counter. If this is the first message, set the started timestamp.
// If it's the last message, set the stopped timestamp and compute the total runtime
// and print it out. Return true if it's the last message, otherwise return false.
func (handler *ThroughputMessageHandler) ReceiveMessage(message []byte) bool {
	if !handler.hasStarted {
		handler.hasStarted = true
		handler.started = time.Now().UnixNano()
	}

	handler.messageCounter++

	if handler.messageCounter == handler.NumberOfMessages {
		handler.stopped = time.Now().UnixNano()
		ms := float32(handler.stopped-handler.started) / 1000000.0
		log.Printf("Received %d messages in %f ms\n", handler.NumberOfMessages, ms)
		log.Printf("Received %f per second\n", 1000*float32(handler.NumberOfMessages)/ms)

		handler.completionLock.Lock()
		handler.hasCompleted = true
		handler.completionLock.Unlock()

		return true
	}

	return false
}

func (handler *LatencyMessageHandler) HasCompleted() bool {
	handler.completionLock.Lock()
	defer handler.completionLock.Unlock()
	return handler.hasCompleted
}

// Record each message's latency. The message contains the timestamp when it was sent.
// If it's the last message, compute the average latency and print it out. Return true
// if the message is the last one, otherwise return false.
func (handler *LatencyMessageHandler) ReceiveMessage(message []byte) bool {
	if handler.Channel != "0" {
		return false
	}
	now := time.Now().UnixNano()
	then1, _ := binary.Varint(message[0:18])
	then2, _ := binary.Varint(message[19:37])

	// TODO: Figure out why nanomsg and ZeroMQ sometimes receive empty messages.
	if then1 != 0 {
		handler.Latencies = append(handler.Latencies, (float32(now-then1))/1000/1000)
		x:= strconv.FormatInt(now-then1, 10)
		handler.Results=append(handler.Results, x...)
		handler.Results=append(handler.Results, " "...)
		x=strconv.FormatInt(now-then2, 10)
		handler.Results=append(handler.Results, x...)
		handler.Results=append(handler.Results, "\n"...)
	}

	handler.messageCounter++
	if handler.messageCounter >= handler.NumberOfMessages {
		sum := float32(0)
		for _, latency := range handler.Latencies {
			sum += latency
		}
		avgLatency := float32(sum) / float32(len(handler.Latencies))
		log.Printf("Mean latency for %d messages: %f ms\n", handler.NumberOfMessages,
			avgLatency)

		ioutil.WriteFile("ret1", handler.Results, 0777)
		//handler.completionLock.Lock()
		//handler.hasCompleted = true
		//handler.completionLock.Unlock()

		//return true
	}

	return false
}

func (endpoint ReceiveEndpoint) WaitForCompletion() {
	for {
		if (*endpoint.Handler).HasCompleted() {
			break
		} else {
			time.Sleep(10 * time.Millisecond)
		}
	}
}
