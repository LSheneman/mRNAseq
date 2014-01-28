#!/bin/bash -e
#general packages
apt-get install sysstat --force-yes 
SOFTWARE_SOURCE=/root/mRNAseq/source

#Install eel-pond scripts
git clone https://github.com/ctb/eel-pond.git /usr/local/share/eel-pond

#Get nema data
cd /mnt
mkdir work 
cd work
curl -O https://s3.amazonaws.com/public.ged.msu.edu/trinity-nematostella-raw.fa.gz

${SOFTWARE_SOURCE}/screed_install.sh 
${SOFTWARE_SOURCE}/khmer_install.sh 
${SOFTWARE_SOURCE}/trimmomatic_install.sh
${SOFTWARE_SOURCE}/libgtextutils_install.s
${SOFTWARE_SOURCE}/fastx_install.sh 
${SOFTWARE_SOURCE}/trinity_install.sh 
${SOFTWARE_SOURCE}/bowtie_install.sh 
${SOFTWARE_SOURCE}/samtools_install.sh 
${SOFTWARE_SOURCE}/blast_install.sh
${SOFTWARE_SOURCE}/rsem_install.sh
exit 0
