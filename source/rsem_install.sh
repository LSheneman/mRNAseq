#!/bin/bash -e
#Install RSEM
apt-get -y install r-base-core r-cran-gplots

cd /root
curl -O http://deweylab.biostat.wisc.edu/rsem/src/rsem-1.2.8.tar.gz
tar xzf rsem-1.2.8.tar.gz
cd rsem-1.2.8
make
cd EBSeq
make

echo 'export PATH=$PATH:/root/rsem-1.2.8' >> ~/.bashrc
source ~/.bashrc

exit 0