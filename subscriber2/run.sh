#!/bin/bash
#x=1
#while [ $x -le 5 ]
#do
#	go run main.go
#	echo "$x"
#	x=$(( $x + 1 ))
#done

for i in `seq 0 63`;
do
    go run main.go $i &
done 
