#!/bin/bash
#Quality trim each pair of files

quality ()
{
for i in *.pe.fq.gz *.se.fq.gz
do
     echo working with $i
     newfile="$(basename $i .fq.gz)"
     gunzip -c $i | fastq_quality_filter -Q33 -q 30 -p 50 | gzip -9c > "${newfile}.qc.fq.gz"
done
}

quality()
touch qualitytrim.time.txt
while [ ! -f time/qualitytrim.time ]
do
	mpstat -P ALL 1 1 >> qualitytrim.time.txt
	sleep 5
done