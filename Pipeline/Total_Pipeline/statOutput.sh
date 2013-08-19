#!/bin/bash
touch $1.mp.txt , $1.vm.txt
until [ -f ../time/$1 ]
do
	mpstat -P ALL 1 2 | tail -6 >> output/$1.mp.txt
	vmstat 1 2 | (head -2; tail -1) | tail -2 >> output/$1.vm.txt
	sleep 5
done