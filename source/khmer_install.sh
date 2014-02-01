#!/bin/bash -e
#Install Khmer
cd /usr/local/share
git clone https://github.com/ged-lab/khmer.git
cd khmer
git checkout protocols-v0.8.3
make

echo 'export PYTHONPATH=$PYTHONPATH:/usr/local/share/khmer' >> ~/.bashrc
source ~/.bashrc

exit 0