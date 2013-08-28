#!/bin/bash
touch $1.vm.txt $1.mp.txt
until [ -f $1.time.done ]
do 
    mpstat -P ALL 1 2 | tail -6 >> $1.mp.txt
    vmstat 1 2 | (head -2; tail -1) | tail -2 >> $1.vm.txt
    sleep 5
done
echo "Stats written"
