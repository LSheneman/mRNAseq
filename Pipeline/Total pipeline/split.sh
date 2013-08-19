#!/bin/bash
#Preparing files for Trinity

for i in *.pe.qc.keep.abundfilt.fq.gz
do
     python /usr/local/share/khmer/sandbox/split-pe.py $i
done

cat *.1 > left.fq
cat *.2 > right.fq

gunzip -c *.se.qc.keep.abundfilt.fq.gz >> left.fq