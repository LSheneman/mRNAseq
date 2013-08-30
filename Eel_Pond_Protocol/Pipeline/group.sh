for i in *.fq.gz.part
do
	python /usr/local/share/eel-pond/rename-with-partitions.py nema $i
	mv $i.renamed.fq.gz $i.renamed.fq.gz
done