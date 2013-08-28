#Install Trinity version r2013-02-25
cd /root
curl -L http://sourceforge.net/projects/trinityrnaseq/files/trinityrnaseq_r2013-02-25.tgz/download?source=files > trinity.tar.gz
tar xzf trinity.tar.gz
cd trinityrnaseq*
export FORCE_UNSAFE_CONFIGURE=1
make
export TRINITY_HOME = /software/trinityrnaseq

#Install Bowtie 0.12.9
cd /root
curl -O -L http://sourceforge.net/projects/bowtie-bio/files/bowtie/0.12.9/bowtie-0.12.9-linux-x86_64.zip
unzip bowtie-0.12.9-linux-x86_64.zip
cd bowtie-0.12.9
cp bowtie bowtie-build bowtie-inspect /usr/local/bin

#Install Samtools
cd /root
curl -O -L http://sourceforge.net/projects/samtools/files/samtools/0.1.18/samtools-0.1.18.tar.bz2
tar xvfj samtools-0.1.18.tar.bz2
cd samtools-0.1.18
make
cp samtools /usr/local/bin
cd misc/
cp *.pl maq2sam-long maq2sam-short md5fa md5sum-lite wgsim /usr/local/bin/
cd ..
cd bcftools
cp *.pl bcftools /usr/local/bin/

#Install R
apt-get install r-base-core 

#Install blast
install pygr
install whoosh
install git+https://github.com/ctb/pygr-draw.git
install git+https://github.com/ged-lab/screed.git
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
cd /root/blastkit
python ./check.py

#get data
cd /mnt && mkdir work && cd work
curl -O http://sourceforge.net/projects/trinityrnaseq/files/misc/TrinityNatureProtocolTutorial.tgz/download
tar –xvf TrinityNatureProtocolTutorial.tgz