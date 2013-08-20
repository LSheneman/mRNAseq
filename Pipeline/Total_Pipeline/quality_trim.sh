#!/bin/bash
#Quality trim each pair of files
splitData()
{
for i in *.pe.fq.gz *.se.fq.gz
do
     echo working with $i
     newfile="$(basename $i .fq.gz)"
     gunzip -c $i | fastq_quality_filter -Q33 -q 30 -p 50 | gzip -9c > "${newfile}.qc.fq.gz"
done
}

progress()
{
/usr/bin/time -o ../time/quality_trim.sh.time splitData()
done
}

progress() &
touch quality_trim.sh.mp.txt , quality_trim.sh.vm.txt
until [ -f ../time/quality_trim.sh.time ]
do
	mpstat -P ALL 1 2 | tail -6 >> ../output/quality_trim.sh.mp.txt
	vmstat 1 2 | (head -2; tail -1) | tail -2 >> ../output/quality_trim.sh.vm.txt
	sleep 5
done