#!/bin/bash
#Run RSEM on list.txt

ln -fs data/*.pe.qc.fq.gz .
ls -1 *.pe.qc.fq.gz > list.txt

n=1
for filename in $(cat list.txt)
do
    echo mapping $filename
    gunzip -c $filename > ${n}.fq
    /usr/local/share/khmer/scripts/split-paired-reads.py ${n}.fq
    rsem-calculate-expression --paired-end ${n}.fq.1 ${n}.fq.2 nema -p 4 ${n}.fq
    rm ${n}.fq ${n}.fq.[12] ${n}.fq.transcript.bam ${n}.fq.transcript.sorted.bam
    n=$(($n + 1))
done