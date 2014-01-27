#!/bin/bash
#general packages
apt-get install sysstat --force-yes 
SOFTWARE_SOURCE=/root/mRNAseq/source

#Install eel-pond scripts
git clone https://github.com/ctb/eel-pond.git /usr/local/share/eel-pond

#Get nema data
cd /mnt
mkdir work && cd work
curl -O https://s3.amazonaws.com/public.ged.msu.edu/trinity-nematostella-raw.fa.gz

${SOFTWARE_SOURCE}/screed_install.sh
if($? -ne 0) then exit 1
echo "screed install successful"
${SOFTWARE_SOURCE}/khmer_install.sh 
if($? -ne 0) then exit 1
echo "khmer install successful"
${SOFTWARE_SOURCE}/trimmomatic_install.sh
if($? -ne 0) then exit 1
echo "trimmomatic_install install successful"
${SOFTWARE_SOURCE}/libgtextutils_install.sh
if($? -ne 0) then exit 1
echo "libgtextutils_install install successful"
${SOFTWARE_SOURCE}/fastx_install.sh
if($? -ne 0) then exit 1
echo "fastx_install install successful"
${SOFTWARE_SOURCE}/trinity_install.sh
if($? -ne 0) then exit 1
echo "trinity_install install successful"
${SOFTWARE_SOURCE}/bowtie_install.sh
if($? -ne 0) then exit 1
echo "bowtie_install install successful"
${SOFTWARE_SOURCE}/samtools_install.sh
if($? -ne 0) then exit 1
echo "samtools_install install successful"
${SOFTWARE_SOURCE}/blast_install.sh
if($? -ne 0) then exit 1
echo "blast_install install successful"
exit 0