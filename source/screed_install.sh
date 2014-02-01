#!/bin/bash -e
#Script to install screed
cd /usr/local/share
git clone https://github.com/ged-lab/screed.git
cd screed
git checkout protocols-v0.8.3
python setup.py install

exit 0