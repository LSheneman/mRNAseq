#Install Trinity
cd /root
curl -L http://sourceforge.net/projects/trinityrnaseq/files/latest/download?source=files > trinity.tar.gz
tar xzf trinity.tar.gz
cd trinityrnaseq*
export FORCE_UNSAFE_CONFIGURE=1
make