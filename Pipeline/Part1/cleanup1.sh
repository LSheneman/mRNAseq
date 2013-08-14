#!/bin/bash
# Cleaning up files after step 1: Quality Trimming and Filtering Your Sequences

rm *.fastq.gz
rm *.pe.fq.gz *.se.fq.gz
rm *.pe.qc.fq.gz

#Rename the files to make them easier to read 
for i in *.pe.qc.fq.gz.pe
do
   newfile="$(basename $i .pe.qc.fq.gz.pe).pe.qc.fq"
   mv $i $newfile
   gzip $newfile
done

#Combine all files from one sample into a zip file
for i in *.pe.qc.fq.gz.se
do
  otherfile="$(basename $i .pe.qc.fq.gz.se).se.qc.fq.gz"
  gunzip -c $otherfile > combine
  cat $i >> combine
  gzip -c combine > $otherfile
  rm $i
done

#Change the rights to make them hard to delete
chmod u-w *.qc.fq.gz
