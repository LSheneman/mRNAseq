#!/bin/bash
#The Eel Pond mRNAseq Tutorial - Software install


#Install screed
cd /usr/local/share
git clone https://github.com/ged-lab/screed.git
cd screed
python setup.py install

#Install khmer
cd /usr/local/share
git clone https://github.com/ged-lab/khmer.git -b bleeding-edge
cd khmer
make

echo 'export PYTHONPATH=/usr/local/share/khmer/python' >> ~/.bashrc
source ~/.bashrc

#Install Trimmomactic
cd /root
curl -O http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.27.zip
unzip Trimmomatic-0.27.zip
cp Trimmomatic-0.27/trimmomatic-0.27.jar /usr/local/bin

#Install libgtextutils and fastx
cd /root
curl -O http://hannonlab.cshl.edu/fastx_toolkit/libgtextutils-0.6.1.tar.bz2
tar xjf libgtextutils-0.6.1.tar.bz2
cd libgtextutils-0.6.1/
./configure && make && make install

cd /root
curl -O http://hannonlab.cshl.edu/fastx_toolkit/fastx_toolkit-0.0.13.2.tar.bz2
tar xjf fastx_toolkit-0.0.13.2.tar.bz2
cd fastx_toolkit-0.0.13.2/
./configure && make && make install

#Install Trinity
cd /root

curl -L http://sourceforge.net/projects/trinityrnaseq/files/latest/download?source=files > trinity.tar.gz

tar xzf trinity.tar.gz
cd trinityrnaseq_r2013-02-25/
export FORCE_UNSAFE_CONFIGURE=1
make

#Install bowtie
cd /root
curl -O -L http://sourceforge.net/projects/bowtie-bio/files/bowtie/0.12.7/bowtie-0.12.7-linux-x86_64.zip
unzip bowtie-0.12.7-linux-x86_64.zip
cd bowtie-0.12.7
cp bowtie bowtie-build bowtie-inspect /usr/local/bin

#Install BLAST and blastkit
pip install pygr
pip install whoosh
pip install git+https://github.com/ctb/pygr-draw.git
pip install git+https://github.com/ged-lab/screed.git
apt-get -y install lighttpd

cd /etc/lighttpd/conf-enabled
ln -fs ../conf-available/10-cgi.conf ./
echo 'cgi.assign = ( ".cgi" => "" )' >> 10-cgi.conf
echo 'index-file.names += ( "index.cgi" ) ' >> 10-cgi.conf
/etc/init.d/lighttpd restart

cd /root
curl -O ftp://ftp.ncbi.nih.gov/blast/executables/release/2.2.24/blast-2.2.24-x64-linux.tar.gz
tar xzf blast-2.2.24-x64-linux.tar.gz
cp blast-2.2.24/bin/* /usr/local/bin
cp -r blast-2.2.24/data /usr/local/blast-data

cd /root
git clone https://github.com/ctb/blastkit.git -b ec2
cd blastkit/www
ln -fs $PWD /var/www/blastkit

mkdir files
chmod a+rxwt files
chmod +x /root

#Get data
# mkdir /data
# mount /dev/xvdf /data
cd /mnt
mkdir work
cd work
mkdir time

#Eel Pond scripts
git clone https://github.com/ctb/eel-pond.git /usr/local/share/eel-pond

touch softwareTest.time
