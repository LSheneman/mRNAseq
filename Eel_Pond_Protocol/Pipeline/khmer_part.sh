for i in *.fq.gz
do
   /usr/local/share/khmer/scripts/do-partition.py -x 1e9 -N 4 --threads 4 nema $i
	mv $.fq.gz.part.renamed.fasta.gz $i.renamed.fq.gz
done
