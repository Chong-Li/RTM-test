package benchmark

import (
	"encoding/binary"
	"log"
	"time"
	//"strconv"
	//"fmt"
)

type MessageSender interface {
	Send([]byte)
}

type SendEndpoint struct {
	MessageSender MessageSender
}

func (endpoint SendEndpoint) TestThroughput(messageSize int, numberToSend int) {
	message := make([]byte, messageSize)
	start := time.Now().UnixNano()
	for i := 0; i < numberToSend; i++ {
		endpoint.MessageSender.Send(message)
	}

	stop := time.Now().UnixNano()
	ms := float32(stop-start) / 1000000
	log.Printf("Sent %d messages in %f ms\n", numberToSend, ms)
	log.Printf("Sent %f per second\n", 1000*float32(numberToSend)/ms)
}

func (endpoint SendEndpoint) TestLatency(messageSize int, numberToSend int) {
	start := time.Now().UnixNano()
	b := make([]byte, 24)
	id :=make([]byte, 5)
	//b:=[]byte{}
	//time.Sleep(5000*time.Millisecond)
	for i := 0; i < numberToSend; i++ {
		if i==1{
			time.Sleep(5* time.Second)
		}
		binary.PutVarint(b, time.Now().UnixNano())
		binary.PutVarint(id, int64(i))
		//b=append(b, strconv.FormatInt(int64(i), 10)...)
		copy(b[19:23], id[:])
		
		
		endpoint.MessageSender.Send(b)
		time.Sleep(4096 * time.Microsecond)
	}

	stop := time.Now().UnixNano()
	ms := float32(stop-start) / 1000000
	log.Printf("Sent %d messages in %f ms\n", numberToSend, ms)
	log.Printf("Sent %f per second\n", 1000*float32(numberToSend)/ms)
}
