for i in *.fq.gz
do
   /usr/local/share/khmer/scripts/do-partition.py -x 1e9 -N 4 --threads 4 nema $i

done
	