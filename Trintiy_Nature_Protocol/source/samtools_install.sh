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