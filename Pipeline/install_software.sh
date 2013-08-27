#!/bin/bash
#general packages
apt-get install sysstat
SOFTWARE_SOURCE=/root/mRNAseq/source

#Install eel-pond scripts
git clone https://github.com/ctb/eel-pond.git /usr/local/share/eel-pond

#Get nema data
cd /mnt/work
curl -O https://s3.amazonaws.com/public.ged.msu.edu/trinity-nematostella-raw.fa.gz

${SOFTWARE_SOURCE}/screed.sh
${SOFTWARE_SOURCE}/khmer.sh 
#${SOFTWARE_SOURCE}/trimmomatic_install.sh
#${SOFTWARE_SOURCE}/fastx_install.sh
#${SOFTWARE_SOURCE}/libgtextutils.sh
#${SOFTWARE_SOURCE}/trinity.sh
#${SOFTWARE_SOURCE}/bowtie.sh
#${SOFTWARE_SOURCE}/samtools.sh


