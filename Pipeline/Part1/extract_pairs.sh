#!/bin/bash
#Extracting paired ends from the interleaved files

for i in *.pe*.qc.fq.gz
do
   python /usr/local/share/khmer/sandbox/strip-and-split-for-assembly.py $i
done