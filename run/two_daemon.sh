../bin/nsqd -verbose=false -mem-queue-size=20000 -data-path="temp1"  &
chrt -r -p 94 $!

#../nsqd2 -verbose=false -mem-queue-size=20000 -tcp-address="0.0.0.0:4152" -http-address="0.0.0.0:4153" -data-path="temp2" &
#chrt -r -p 94 $!
