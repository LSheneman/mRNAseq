#!/bin/bash
#Extracting paired ends from the interleaved files

extract()
{
	for i in *.pe*.qc.fq.gz
	do
	python /usr/local/share/khmer/sandbox/strip-and-split-for-assembly.py $i
	done
}

extract()
touch extract_pairs.time.txt
while [ ! -f time/extract_pairs.time ]
do
	mpstat -P ALL 1 1 >> extract_pairs.time.txt
	sleep 5
done