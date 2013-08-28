#!/bin/bash
#Extracting paired ends from the interleaved files

for i in *.pe.qc.fq.gz
do
   /usr/local/share/khmer/scripts/extract-paired-reads.py $i
done