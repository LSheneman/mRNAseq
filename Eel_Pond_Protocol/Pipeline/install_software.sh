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
if($? -ne 0) 
then exit 1 
else
	echo "screed install successful" fi

exit 0