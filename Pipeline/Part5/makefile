KHMER=/usr/local/share/khmer

	
all: copydata benchmarks 

copydata:
	cd /mnt
	curl -O https://s3.amazonaws.com/public.ged.msu.edu/trinity-nematostella-raw.fa.gz

benchmarks: khmer_part.time group.time format_annotate.sh.time nema.x.mouse.time mouse.x.nema.time nema.x.mouse.homol.time nema.x.mouse.ortho.time get_mouse_info.sh.time trinity-nematostella.renamed.fa.annot.time

khmer_part.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/khmer_part.time ${KHMER}/scripts/do-partition.py -x 1e9 -N 4 --threads 4 nema trinity-nematostella-raw.fa.gz &
	 bash statOutput.sh khmer_part.time.time
	
group.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/group.time python /usr/local/share/eel-pond/rename-with-partitions.py nema trinity-nematostella-raw.fa.gz.part &
	 bash statOutput.sh group.time
	mv trinity-nematostella-raw.fa.gz.part.renamed.fasta.gz trinity-nematostella.renamed.fa.gz

format_annotate.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/format_annotate.sh.time sh format_annotate.sh &
	 bash statOutput.sh format_annotate.sh.time
	
nema.x.mouse.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/nema.x.mouse.time blastall -i trinity-nematostella.renamed.fa -d mouse.protein.faa -e 1e-3 -p blastx -o nema.x.mouse -a 8 -v 4 -b 4 &
	 bash statOutput.sh nema.x.mouse.time

mouse.x.nema.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/mouse.x.nema.time blastall -i mouse.protein.faa -d trinity-nematostella.renamed.fa -e 1e-3 -p tblastn -o mouse.x.nema -a 8 -v 4 -b 4 &
	 bash statOutput.sh mouse.x.nema.time

#putative homology (best BLAST hit) 
nema.x.mouse.homol.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/nema.x.mouse.homol.time python /usr/local/share/eel-pond/make-uni-best-hits.py nema.x.mouse nema.x.mouse.homol &
	 bash statOutput.sh nema.x.mouse.homol.time

nema.x.mouse.ortho.time:	
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/nema.x.mouse.ortho.time python /usr/local/share/eel-pond/make-reciprocal-best-hits.py nema.x.mouse mouse.x.nema nema.x.mouse.ortho &
	 bash statOutput.sh nema.x.mouse.ortho.time

get_mouse_info.sh.time:	
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/get_mouse_info.sh.time sh get_mouse_info.sh.sh &
	 bash statOutput.sh get_mouse_info.sh.time 

trinity-nematostella.renamed.fa.annot.time:	
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/trinity-nematostella.renamed.fa.annot.time python /usr/local/share/eel-pond/annotate-seqs.py trinity-nematostella.renamed.fa nema.x.mouse.ortho nema.x.mouse.homol &
	 bash statOutput.sh trinity-nematostella.renamed.fa.annot.time
	mv trinity-nematostella.renamed.fa.annot nematostella.fa