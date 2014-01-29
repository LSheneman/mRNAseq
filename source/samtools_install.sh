#!/bin/bash -e
#Install Samtools
cd /root
curl -L http://sourceforge.net/projects/samtools/files/latest/download?source=files >samtools.tar.bz2
tar xjf samtools.tar.bz2
mv samtools-* samtools-latest

cd samtools-latest/
make
cp samtools bcftools/bcftools misc/* /usr/local/bin

exit 0