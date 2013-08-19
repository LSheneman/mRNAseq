#!/bin/bash
touch $1.mp.txt , $1.vm.txt
until [ -f $1.time ]
do
	mpstat -P ALL 1 2 | (head -2; tail -5) >> $1.mp.txt
	vmstat 1 2 | (head -2; tail -1) | tail -2 >> $1.vm.txt
	sleep 5
done