#!/bin/bash -e
#Install Trimmomatic
cd /root
curl -O http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.30.zip
unzip Trimmomatic-0.30.zip

cd Trimmomatic-0.30/
cp trimmomatic-0.30.jar /usr/local/bin
cp -r adapters /usr/local/share/adapters

exit 0