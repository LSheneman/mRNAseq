#!/bin/bash -e
#Install Blast
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
exit 0