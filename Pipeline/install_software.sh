#!/bin/bash
#general packages

apt-get install sysstat

#Install eel-pond scripts
git clone https://github.com/ctb/eel-pond.git /usr/local/share/eel-pond

#Get nema data
cd /mnt/work
curl -O https://s3.amazonaws.com/public.ged.msu.edu/trinity-nematostella-raw.fa.gz

../bowtie.sh
../fastx_install.sh
../libgtextutils.sh
../samtools.sh
../trinity.sh
../screed.sh
../khmer.sh 