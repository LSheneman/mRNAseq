   cd /usr/local/share
   git clone https://github.com/ctb/eel-pond.git
   cd eel-pond
   git checkout protocols-v0.8.3

   cd /usr/local/share
   git clone https://github.com/ged-lab/khmer.git -b protocols-v0.8.5
   cd khmer
   make install

   cd /root
   curl -O http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.30.zip
   unzip Trimmomatic-0.30.zip
   cd Trimmomatic-0.30/
   cp trimmomatic-0.30.jar /usr/local/bin
   cp -r adapters /usr/local/share/adapters

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

   cd /root
   curl -L http://sourceforge.net/projects/trinityrnaseq/files/latest/download?source=files > trinity.tar.gz
   tar xzf trinity.tar.gz
   cd trinityrnaseq*/
   export FORCE_UNSAFE_CONFIGURE=1
   make

   cd /root
   curl -O -L http://sourceforge.net/projects/bowtie-bio/files/bowtie/0.12.7/bowtie-0.12.7-linux-x86_64.zip
   unzip bowtie-0.12.7-linux-x86_64.zip
   cd bowtie-0.12.7
   cp bowtie bowtie-build bowtie-inspect /usr/local/bin
   
   cd /root
   curl -L http://sourceforge.net/projects/samtools/files/latest/download?source=files >samtools.tar.bz2
   tar xjf samtools.tar.bz2
   mv samtools-* samtools-latest
   cd samtools-latest/
   make
   cp samtools bcftools/bcftools misc/* /usr/local/bin

   cd /root
   curl -O ftp://ftp.ncbi.nih.gov/blast/executables/release/2.2.24/blast-2.2.24-x64-linux.tar.gz
   tar xzf blast-2.2.24-x64-linux.tar.gz
   cp blast-2.2.24/bin/* /usr/local/bin
   cp -r blast-2.2.24/data /usr/local/blast-data

   apt-get -y install r-base-core r-cran-gplots
   
   cd /root
   curl -O http://deweylab.biostat.wisc.edu/rsem/src/rsem-1.2.8.tar.gz
   tar xzf rsem-1.2.8.tar.gz
   cd rsem-1.2.8
   make
   cd EBSeq
   make
   echo 'export PATH=$PATH:/root/rsem-1.2.8' >> ~/.bashrc