#!/bin/bash
#Quality trim each pair of files

for i in *.pe.fq.gz *.se.fq.gz
do
  echo working with $i
newfile="$(basename $i .fq.gz)"
gunzip -c $i | fastq_quality_filter -Q33 -q 30 -p 50 | gzip -9c > "${newfile}.qc.fq.gz"
done