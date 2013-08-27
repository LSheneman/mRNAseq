#!/bin/bash
#general packages
apt-get install sysstat
SOFTWARE SOURCE=../source

#Install eel-pond scripts
git clone https://github.com/ctb/eel-pond.git /usr/local/share/eel-pond

#Get nema data
cd /mnt/work
curl -O https://s3.amazonaws.com/public.ged.msu.edu/trinity-nematostella-raw.fa.gz

${SOFTWARE SOURCE}/screed.sh
${SOFTWARE SOURCE}/khmer.sh 
#${SOFTWARE SOURCE}/trimmomatic_install.sh
#${SOFTWARE SOURCE}/fastx_install.sh
#${SOFTWARE SOURCE}/libgtextutils.sh
#${SOFTWARE SOURCE}/trinity.sh
#${SOFTWARE SOURCE}/bowtie.sh
#${SOFTWARE SOURCE}/samtools.sh


