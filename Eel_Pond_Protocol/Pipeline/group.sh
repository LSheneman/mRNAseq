for i in *.fa.gz.part
do
	python /usr/local/share/eel-pond/rename-with-partitions.py nema $i
	mv $i $i.renamed.fa.gz
done