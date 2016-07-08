package mq

import (
	"strconv"
	"github.com/bitly/go-nsq"
	"github.com/Chong-Li/RTM-test/subscriber2/benchmark"
)

type Nsq struct {
	handler benchmark.MessageHandler
	pub     *nsq.Producer
	sub     *nsq.Consumer
	topic   string
	channel string
        raw_channel string
}

func NewNsq(numberOfMessages int, testLatency bool, channeL string) *Nsq {
	//topic := "1#ephemeral"
	//topic := "0"
	channel := channeL
	channel += "n#ephemeral"
	topic := channel	
	pub, _ := nsq.NewProducer("localhost:4150", nsq.NewConfig())
	//if channeL == "1"{
		//pub, _ = nsq.NewProducer("192.168.1.11:4150", nsq.NewConfig())
	//}
	config :=nsq.NewConfig()
	config.MaxInFlight = 1000
	config.OutputBufferSize= 8192
	sub, _ := nsq.NewConsumer(topic, channel, config)
	var handler benchmark.MessageHandler
	if testLatency {
		handler = &benchmark.LatencyMessageHandler{
			NumberOfMessages: numberOfMessages,
			Latencies:        []float32{},
			Channel:	channeL,
			Pub:		pub,
		}
	} else {
		handler = &benchmark.ThroughputMessageHandler{NumberOfMessages: numberOfMessages}
	}

	return &Nsq{
		handler: handler,
		pub:     pub,
		sub:     sub,
		topic:   topic,
		channel: channel,
		raw_channel: channeL,
	}
}

func (n *Nsq) Setup() {
	n.sub.AddHandler(nsq.HandlerFunc(func(message *nsq.Message) error {
		n.handler.ReceiveMessage(message.Body)
		return nil
	}))
	i, _ := strconv.Atoi(n.raw_channel)
	if i < 1280 {
		n.sub.ConnectToNSQD("10.0.0.26:4150")
	} else {
		n.sub.ConnectToNSQD("localhost:4150")
	}
}

func (n *Nsq) Teardown() {
	n.sub.Stop()
	n.pub.Stop()
}

func (n *Nsq) Send(message []byte) {
	//n.pub.PublishAsync(n.topic, message, nil)
}

func (n *Nsq) MessageHandler() *benchmark.MessageHandler {
	return &n.handler
}
