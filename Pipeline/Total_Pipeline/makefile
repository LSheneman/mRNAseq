#Make file for The Eel Pond Pipeline

all: copyadapters1 benchmarksPart1 


copyadapters1:
	curl -O https://s3.amazonaws.com/public.ged.msu.edu/illuminaClipping.fa
	
benchmarksPart1: adapter_trim.time trim_run.sh.time 

adapter_trim.time:
	-echo 3 > /proc/sys/vm/drop_caches
	/usr/bin/time -o ../time/adapter_trim.time bash adapter_trim.sh & bash statOutput.sh adapter_trim.time

trim_run.sh.time: adapter_trim.time
	-echo 3 > /proc/sys/vm/drop_caches
	/usr/bin/time -o ../time/trim_run.sh.time bash trim.sh & bash statOutput.sh trim_run.sh.time

# quality_trim.sh.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/qualitytrim.time bash quality_trim.sh & bash statOutput.sh diginorm_pe.sh.time

# extract_pairs.sh.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/extract_pairs.time bash extract_pairs.sh & bash statOutput.sh diginorm_pe.sh.time

# trim_clean.sh.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/trim_clean.time bash trim_clean.sh & bash statOutput.sh diginorm_pe.sh.time 

# benchmarksPart2: diginorm_pe.time diginorm_se.time filter-adund.time diginorm_clean.sh.time

# #Apply digital normalization to the paired-end reads
# diginorm_pe.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/diginorm_pe.time python ${KHMER}/scripts/normalize-by-median.py -p -k 20 -C 20 -N 4 -x 3e9 --savehash normC20k20.kh *.pe.qc.fq.gz &
# 	 bash statOutput.sh diginorm_pe.sh.time

# #Apply digital normalization to the singled-end reads
# diginorm_se.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/diginorm_se.time python ${KHMER}/scripts/normalize-by-median.py -k 20 -C 20 -N 4 -x 3e9 --loadhash normC20k20.kh --savehash normC20k20.kh *.se.qc.fq.gz &
# 	bash statOutput.sh diginorm_se.time

# #trim off low-abundance parts of high-coverage reads
# filter-adund.time:	
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/filter-adund.time ${KHMER}/scripts/filter-abund.py -V normC20k20.kh *.keep &
# 	bash statOutput.sh filter-adund.time
	
# #Clean up the files
# diginorm_clean.sh.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/diginorm_clean.sh.time bash cleanup2.sh & bash statOutput.sh diginorm_clean.sh.time 



# benchmarksPart3: trinity_split.sh.time trinity.time

# trinity_split.sh.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/trinity_split.sh.time sh split.sh  &
# 	 bash statOutput.sh trinity_split.sh.time

# #Change -JM 15G based on machine memory
# trinity.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/trinity.time /root/trinityrnaseq_r2013-02-25/Trinity.pl --left left.fq --right right.fq --seqType fq -JM 15G  &
# 	 bash statOutput.sh trinity.time

# copydata5:
# 	cd /mnt
# 	curl -O https://s3.amazonaws.com/public.ged.msu.edu/trinity-nematostella-raw.fa.gz

# benchmarksPart5: khmer_part.time group.time format_annotate.sh.time nema.x.mouse.time mouse.x.nema.time nema.x.mouse.homol.time nema.x.mouse.ortho.time get_mouse_info.sh.time trinity-nematostella.renamed.fa.annot.time

# khmer_part.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/khmer_part.time ${KHMER}/scripts/do-partition.py -x 1e9 -N 4 --threads 4 nema trinity-nematostella-raw.fa.gz &
# 	 bash statOutput.sh khmer_part.time.time
	
# group.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/group.time python /usr/local/share/eel-pond/rename-with-partitions.py nema trinity-nematostella-raw.fa.gz.part &
# 	 bash statOutput.sh group.time
# 	mv trinity-nematostella-raw.fa.gz.part.renamed.fasta.gz trinity-nematostella.renamed.fa.gz

# format_annotate.sh.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/format_annotate.sh.time sh format_annotate.sh &
# 	 bash statOutput.sh format_annotate.sh.time
	
# nema.x.mouse.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/nema.x.mouse.time blastall -i trinity-nematostella.renamed.fa -d mouse.protein.faa -e 1e-3 -p blastx -o nema.x.mouse -a 8 -v 4 -b 4 &
# 	 bash statOutput.sh nema.x.mouse.time

# mouse.x.nema.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/mouse.x.nema.time blastall -i mouse.protein.faa -d trinity-nematostella.renamed.fa -e 1e-3 -p tblastn -o mouse.x.nema -a 8 -v 4 -b 4 &
# 	 bash statOutput.sh mouse.x.nema.time

# #putative homology (best BLAST hit) 
# nema.x.mouse.homol.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/nema.x.mouse.homol.time python /usr/local/share/eel-pond/make-uni-best-hits.py nema.x.mouse nema.x.mouse.homol &
# 	 bash statOutput.sh nema.x.mouse.homol.time

# nema.x.mouse.ortho.time:	
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/nema.x.mouse.ortho.time python /usr/local/share/eel-pond/make-reciprocal-best-hits.py nema.x.mouse mouse.x.nema nema.x.mouse.ortho &
# 	 bash statOutput.sh nema.x.mouse.ortho.time

# get_mouse_info.sh.time:	
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/get_mouse_info.sh.time sh get_mouse_info.sh.sh &
# 	 bash statOutput.sh get_mouse_info.sh.time 

# trinity-nematostella.renamed.fa.annot.time:	
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	/usr/bin/time -o ../time/trinity-nematostella.renamed.fa.annot.time python /usr/local/share/eel-pond/annotate-seqs.py trinity-nematostella.renamed.fa nema.x.mouse.ortho nema.x.mouse.homol &
# 	 bash statOutput.sh trinity-nematostella.renamed.fa.annot.time
# 	mv trinity-nematostella.renamed.fa.annot nematostella.fa
