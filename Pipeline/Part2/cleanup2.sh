#!/bin/bash
#The Eel Pond mRNAseq Tutorial Part 2 - File clean up

#break out the orphaned and still-paired reads
for i in *.pe.*.abundfilt;
do
   python /usr/local/share/khmer/sandbox/strip-and-split-for-assembly.py $i
done

#combine the orphaned reads
for i in *.se.qc.fq.gz.keep.abundfilt
do
   pe_orphans=$(basename $i .se.qc.fq.gz.keep.abundfilt).pe.qc.fq.gz.keep.abundfilt.se
   newfile=$(basename $i .se.qc.fq.gz.keep.abundfilt).se.qc.keep.abundfilt.fq.gz
   cat $i $pe_orphans | gzip -c > $newfile
done

#rename and compress the remaining PE reads
for i in *.abundfilt.pe
do
   newfile=$(basename $i .fq.gz.keep.abundfilt.pe).keep.abundfilt.fq
   mv $i $newfile
   gzip $newfile
done

#remove old files
rm *.se.qc.fq.gz.keep.abundfilt
rm *.pe.qc.fq.gz.keep.abundfilt.se
rm *.keep
rm *.abundfilt
rm *.qc.fq.gz