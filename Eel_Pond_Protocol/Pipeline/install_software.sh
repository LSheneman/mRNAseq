#!/bin/bash -e
#general packages
apt-get -y install sysstat 
apt-get -y install libgtextutils-dev
SOFTWARE_SOURCE=/root/mRNAseq/source
chmod 777 ${SOFTWARE_SOURCE}/blast_install.sh 
chmod 777 ${SOFTWARE_SOURCE}/rsem_install.sh 

#Install eel-pond scripts
git clone https://github.com/ctb/eel-pond.git /usr/local/share/eel-pond

#Get test data
cd /mnt
mkdir work 
cd work
curl -O http://athyra.idyll.org/~t/mrnaseq-subset.tar

${SOFTWARE_SOURCE}/screed_install.sh 
${SOFTWARE_SOURCE}/khmer_install.sh 
${SOFTWARE_SOURCE}/trimmomatic_install.sh
${SOFTWARE_SOURCE}/libgtextutils_install.sh 
${SOFTWARE_SOURCE}/fastx_install.sh 
${SOFTWARE_SOURCE}/trinity_install.sh 
${SOFTWARE_SOURCE}/bowtie_install.sh 
${SOFTWARE_SOURCE}/samtools_install.sh 
${SOFTWARE_SOURCE}/blast_install.sh
${SOFTWARE_SOURCE}/rsem_install.sh
exit 0
