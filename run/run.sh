#!/bin/bash
../bin/publisher 48 &
chrt -r -p 94 $!


../bin/publisher2 128 &
chrt -r -p 94 $!



#sleep 8

#ping 192.168.1.12 -c 13000 -i 0.004 -s 1024 > test.out &
#chrt -r -p 95 $!


#i=1
#while [ "$i" -le 512 ]; do
#  ./NSQ_SINGLE "$i" &
#  chrt -r -p 94 $!
#   i=$(($i+1))
#done
