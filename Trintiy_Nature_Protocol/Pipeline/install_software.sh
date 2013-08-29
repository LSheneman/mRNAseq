#!/bin/bash
#general packages
apt-get install sysstat
apt-get install r-base
SOFTWARE_SOURCE=/root/mRNAseq/Eel_Pond_Protocol/source

#Install eel-pond scripts
git clone https://github.com/ctb/eel-pond.git /usr/local/share/eel-pond

#Get nema data
cd /mnt
mkdir work && cd work
curl -O https://s3.amazonaws.com/public.ged.msu.edu/trinity-nematostella-raw.fa.gz

${SOFTWARE_SOURCE}/trinity_install.sh
${SOFTWARE_SOURCE}/bowtie_install.sh
${SOFTWARE_SOURCE}/samtools_install.sh
${SOFTWARE_SOURCE}/blast.sh
R CMD BATCH