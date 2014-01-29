#Makefile
KHMER=/usr/local/share/khmer

all: adapters quaility diginorm assembly transcript annotate analysis expression
	
adapters:
	curl -O https://s3.amazonaws.com/public.ged.msu.edu/illuminaClipping.fa

quaility: adapter_trim.time trim_run.sh.time quality_trim.sh.time extract_pairs.sh.time trim_clean.sh.time

diginorm: diginorm_pe.sh.time diginorm_se.time filter-adund.time diginorm_clean.sh.time

assembly: trinity_split.sh.time trinity.time

transcript: khmer_part.time group.time

annotate: format_annotate.sh.time nema.x.mouse.time mouse.x.nema.time homology.time orthology.time get_mouse_info.sh.time annotate.time 

analysis: transcript_map.time reference.time rsem.sh.time gene_result.time isoform_result.time

expression: matrixDir.sh.time ebseq.time expression.time visual.time

adapter_trim.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh adapter_trim & time -o adapter_trim.time python ${KHMER}/sandbox/write-trimmomatic.py > trim.sh) || (rm adapter_trim.time.done && false)
	touch adapter_trim.time.done

trim_run.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh trim_run.sh & time -o trim_run.sh.time bash trim.sh)  || (rm trim_run.sh.time.done && false)
	touch trim_run.sh.time.done

quality_trim.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh quality_trim.sh & time -o quality_trim.sh.time bash quality_trim.sh)  || (rm quality_trim.sh.time.done && false)
	touch quality_trim.sh.time.done

extract_pairs.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh extract_pairs.sh & time -o extract_pairs.sh.time bash extract_pairs.sh)  || (rm extract_pairs.sh.time.done && false)
	touch extract_pairs.sh.time.done

trim_clean.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh trim_clean.sh & time -o trim_clean.sh.time bash trim_clean.sh)  || (rm trim_clean.sh.time.done && false)
	touch trim_clean.sh.time.done

#Part 2
diginorm_pe.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh diginorm_pe.sh & time -o diginorm_pe.sh.time python ${KHMER}/scripts/normalize-by-median.py -p -k 20 -C 20 -N 4 -x 3e9 --savehash normC20k20.kh *.pe.qc.fq.gz -p -k 20 -C 20 -N 4 -x 3e9 --savehash normC20k20.kh *.pe.qc.fq.gz)  || (rm diginorm_pe.sh.time.done && false)
	touch diginorm_pe.sh.time.done

diginorm_se.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh diginorm_se & time -o diginorm_se.time python ${KHMER}/scripts/normalize-by-median.py -C 20 --loadhash normC20k20.kh --savehash normC20k20.kh *.se.qc.fq.gz)  || (rm diginorm_se.time.done && false)
	touch diginorm_se.time.done

filter-adund.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh filter-adund & time -o filter-adund.time ${KHMER}/scripts/filter-abund.py -V normC20k20.kh *.keep)  || (rm filter-adund.time.done && false)
	touch filter-adund.time.done

diginorm_clean.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh diginorm_clean.sh & time -o diginorm_clean.sh.time bash cleanup2.sh)  || (rm diginorm_clean.sh.time.done && false)
	touch diginorm_clean.sh.time.done

#Part 3
trinity_split.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh trinity_split.sh & time -o trinity_split.sh.time bash split.sh)  || (rm trinity_split.sh.time.done && false)
	touch trinity_split.sh.time.done

#Change -JM 15G based on machine memory
trinity.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh trinity & time -o trinity.time /root/trinityrnaseq*/Trinity.pl --left left.fq --right right.fq --seqType fq -JM 32G)  || (rm trinity.time.done && false)
	touch trinity.time.done

#Part 5
khmer_part.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh khmer_part & time -o khmer_part.time /usr/local/share/khmer/scripts/do-partition.py -x 1e9 -N 4 --threads 4 nema trinity-nematostella-raw.fa.gz)  || (rm khmer_part.time.done && false)
	touch khmer_part.time.done

group.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh group & time -o group.time python /usr/local/share/eel-pond/rename-with-partitions.py nema trinity-nematostella-raw.fa.gz.part)  || (rm group.time.done && false)
	mv trinity-nematostella-raw.fa.gz.part.renamed.fasta.gz trinity-nematostella.renamed.fa.gz
	touch group.time.done

format_annotate.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh format_annotate.sh & time -o format_annotate.sh.time bash format_annotate.sh)  || (rm format_annotate.sh.time.done && false)
	touch format_annotate.sh.time.done

nema.x.mouse.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh nema.x.mouse & time -o nema.x.mouse.time blastall -i trinity-nematostella.renamed.fa -d mouse.protein.faa -e 1e-3 -p blastx -o nema.x.mouse -a 8 -v 4 -b 4)  || (rm nema.x.mouse.time.done && false)
	touch nema.x.mouse.time:.done

mouse.x.nema.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh mouse.x.nema & time -o mouse.x.nema.time blastall -i mouse.protein.faa -d trinity-nematostella.renamed.fa -e 1e-3 -p tblastn -o mouse.x.nema -a 8 -v 4 -b 4)  || (rm mouse.x.nema.time.done && false)
	touch mouse.x.nema.time.done

homology.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh homology & time -o homology.time python /usr/local/share/eel-pond/make-uni-best-hits.py nema.x.mouse nema.x.mouse.homol)  || (rm homology.time.done && false)
	touch homology.time.done

orthology.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh orthology & time -o orthology.time python /usr/local/share/eel-pond/make-reciprocal-best-hits.py nema.x.mouse mouse.x.nema nema.x.mouse.ortho)  || (rm orthology.time.done && false)
	touch orthology.time.done

get_mouse_info.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh get_mouse_info.sh & time -o get_mouse_info.sh.time bash get_mouse_info.sh)  || (rm get_mouse_info.sh.time.done && false)
	touch get_mouse_info.sh.time.done

annotate.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh annotate & time -o annotate.time python /usr/local/share/eel-pond/annotate-seqs.py trinity-nematostella.renamed.fa nema.x.mouse.ortho nema.x.mouse.homol)  || (rm annotate.time.done && false)
	touch annotate.time.done

#RSEM
transcript_map.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh transcript_map & time -o transcript_map.time python /usr/local/share/eel-pond/make-transcript-to-gene-map-file.py nematostella.fa nematostella.fa.tr_to_genes)  || (rm transcript_map.time.done && false)
	touch transcript_map.time.done

reference.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh reference & time -o reference.time rsem-prepare-reference --transcript-to-gene-map nematostella.fa.tr_to_genes nematostella.fa nema)  || (rm reference.time.done && false)
	touch reference.time.done

rsem.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh rsem.sh & time -o rsem.sh.time bash rsem.sh)  || (rm rsem.sh.time.done && false)
	touch rsem.sh.time.done

gene_result.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh gene_result & time -o gene_result.time rsem-generate-data-matrix ?.fq.genes.results ??.fq.genes.results > genes.results)  || (rm gene_result.time.done && false)
	touch gene_result.time.done

isoform_result.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh isoform_result & time -o isoform_result.time rsem-generate-data-matrix ?.fq.isoforms.results ??.fq.isoforms.results > isoforms.results)  || (rm isoform_result.time.done && false)
	touch isoform_result.time.done

#Differential expression
matrixDir.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh matrixDir.sh & time -o matrixDir.sh.time matrixDir.sh)  || (rm matrixDir.sh.time.done && false)
	touch matrixDir.sh.time.done

ebseq.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh ebseq & time -o ebseq.time rsem-run-ebseq 0-vs-6-hour.matrix 5,5 0-vs-6-hour.changed)  || (rm ebseq.time.done && false)
	touch ebseq.time.done

expression.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh expression & time -o expression.time python /usr/local/share/eel-pond/extract-and-annotate-changed.py 0-vs-6-hour.changed /mnt/nematostella.fa 0-vs-6-hour.changed.csv)  || (rm expression.time.done && false)
	touch expression.time.done

visual.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh visual & time -o visual.time python /usr/local/share/eel-pond/plot-expression.py 0-vs-6-hour.matrix 5,5 0-vs-6-hour.changed.csv)  || (rm visual.time.done && false)
	touch visual.time.done