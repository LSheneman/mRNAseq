#Makefile
KHMER=/usr/local/share/khmer

all: benchmarks
	
adapters:
	curl -O https://s3.amazonaws.com/public.ged.msu.edu/illuminaClipping.fa

benchmarks: adapter_trim.time trim_run.sh.time quality_trim.sh.time extract_pairs.sh.time trim_clean.sh.time \
	diginorm_pe.sh.time diginorm_se.time filter-adund.time diginorm_clean.sh.time \
	trinity_split.sh.time trinity.time \
	khmer_part.time group.time format_annotate.sh.time nema.x.mouse.time \
	mouse.x.nema.time homology.time orthology.time \
	get_mouse_info.sh.time annotate.time

adapter_trim.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh adapter_trim & time -o adapter_trim.time python ${KHMER}/sandbox/write-trimmomatic.py > trim.sh
	touch adapter_trim.time.done

trim_run.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh trim_run.sh & time -o trim_run.sh.time bash trim.sh
	touch trim_run.sh.time.done

quality_trim.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh quality_trim.sh & time -o quality_trim.sh.time bash quality_trim.sh
	touch quality_trim.sh.time.done

extract_pairs.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh extract_pairs.sh & time -o extract_pairs.sh.time bash extract_pairs.sh
	touch extract_pairs.sh.time.done

trim_clean.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh trim_clean.sh & time -o trim_clean.sh.time bash trim_clean.sh
	touch trim_clean.sh.time.done

#Part 2
diginorm_pe.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh diginorm_pe.sh & time -o diginorm_pe.sh.time python ${KHMER}/scripts/normalize-by-median.py -p -k 20 -C 20 -N 4 -x 3e9 --savehash normC20k20.kh *.pe.qc.fq.gz
	touch diginorm_pe.sh.time.done

diginorm_se.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh diginorm_se & time -o diginorm_se.time python ${KHMER}/scripts/normalize-by-median.py -C 20 --loadhash normC20k20.kh --savehash normC20k20.kh *.se.qc.fq.gz
	touch diginorm_se.time.done

filter-adund.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh filter-adund & time -o filter-adund.time ${KHMER}/scripts/filter-abund.py -V normC20k20.kh *.keep
	touch filter-adund.time.done

diginorm_clean.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh diginorm_clean.sh & time -o diginorm_clean.sh.time bash cleanup2.sh
	touch diginorm_clean.sh.time.done

#Part 3
trinity_split.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh trinity_split.sh & time -o trinity_split.sh.time bash split.sh
	touch trinity_split.sh.time.done

#Change -JM 15G based on machine memory
trinity.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh trinity & time -o trinity.time /root/trinityrnaseq*/Trinity.pl --left left.fq --right right.fq --seqType fq -JM 32G
	touch trinity.time.done

#Part 5
khmer_part.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh khmer_part & time -o khmer_part.time /usr/local/share/khmer/scripts/do-partition.py -x 1e9 -N 4 --threads 4 nema trinity-nematostella-raw.fa.gz
	touch khmer_part.time.done

group.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh group & time -o group.time python /usr/local/share/eel-pond/rename-with-partitions.py nema trinity-nematostella-raw.fa.gz.part
	mv trinity-nematostella-raw.fa.gz.part.renamed.fasta.gz trinity-nematostella.renamed.fa.gz
	touch group.time.done

format_annotate.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh format_annotate.sh & time -o format_annotate.sh.time bash format_annotate.sh
	touch format_annotate.sh.time.done

nema.x.mouse.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh nema.x.mouse & time -o nema.x.mouse.time blastall -i trinity-nematostella.renamed.fa -d mouse.protein.faa -e 1e-3 -p blastx -o nema.x.mouse -a 8 -v 4 -b 4
	touch nema.x.mouse.time:.done

mouse.x.nema.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh mouse.x.nema & time -o mouse.x.nema.time blastall -i mouse.protein.faa -d trinity-nematostella.renamed.fa -e 1e-3 -p tblastn -o mouse.x.nema -a 8 -v 4 -b 4
	touch mouse.x.nema.time.done

homology.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh homology & time -o homology.time python /usr/local/share/eel-pond/make-uni-best-hits.py nema.x.mouse nema.x.mouse.homol
	touch homology.time.done

orthology.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh orthology & time -o orthology.time python /usr/local/share/eel-pond/make-reciprocal-best-hits.py nema.x.mouse mouse.x.nema nema.x.mouse.ortho
	touch orthology.time.done

get_mouse_info.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh get_mouse_info.sh & time -o get_mouse_info.sh.time bash get_mouse_info.sh
	touch get_mouse_info.sh.time.done

annotate.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh annotate & time -o annotate.time python /usr/local/share/eel-pond/annotate-seqs.py trinity-nematostella.renamed.fa nema.x.mouse.ortho nema.x.mouse.homol
	touch annotate.time.done