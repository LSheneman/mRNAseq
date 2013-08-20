#!/bin/bash
#Extracting paired ends from the interleaved files
extract()
{
	for i in *.pe*.qc.fq.gz
	do
		python /usr/local/share/khmer/sandbox/strip-and-split-for-assembly.py $i
	done
}

progress()
{
	/usr/bin/time -o ../time/extract_pairs.sh.time extract()
}

stats()
{
	progress() & touch extract_pairs.sh.mp.txt , extract_pairs.sh.vm.txt
	until [ -f ../time/extract_pairs.sh.time ]
	do
		mpstat -P ALL 1 2 | tail -6 >> ../output/extract_pairs.sh.mp.txt
		vmstat 1 2 | (head -2; tail -1) | tail -2 >> ../output/extract_pairs.sh.vm.txt
		sleep 5
	done
}

coproc stats progess
echo "done"