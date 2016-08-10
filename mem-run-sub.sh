#!/bin/bash
i=0
while [ "$i" -le "$1" ]; do
  ../bin/subscriber 10 "$i" &
  chrt -r -p 95 $!
  i=$(($i+10))
done
i=1
while [ "$i" -le "$2" ]; do
	../bin/subscriber2 10 "$i" &
	chrt -r -p 94 $!
	i=$(($i+10))
done

