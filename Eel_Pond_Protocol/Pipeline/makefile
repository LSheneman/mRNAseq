#Makefile
KHMER=/usr/local/share/khmer

all: adapters quaility diginorm assembly transcript annotate analysis expression
	
adapters:
	curl -O https://s3.amazonaws.com/public.ged.msu.edu/illuminaClipping.fa

data:
	curl -O athyra.idyll.org/~t/mrnaseq-subset.tar
	tar -xvvf mrnaseq-subset.tar

quality: adapter_trim.time trim_run.time quality_trim.time extract_pairs.time trim_clean.time

diginorm: diginorm_pe.time diginorm_se.time filter-abund.time diginorm_clean.time

assembly: trinity_split.time trinity.time

transcript: khmer_part.time group.time

annotate: format_annotate.time blastx.time tblastn.time homology.time orthology.time get_mouse_info.time annotate.time 

analysis: transcript_map.time reference.time rsem.time gene-matrix.time 

expression: ebseq.time expression.time visual.time

adapter_trim.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh adapter_trim & time -o adapter_trim.time bash adapter_trim.sh) || (rm adapter_trim.time.done && false)
	touch adapter_trim.time.done

trim_run.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh trim_run.sh & time -o trim_run.time bash trim.sh)  || (rm trim_run.time.done && false)
	touch trim_run.time.done

quality_trim.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh quality_trim & time -o quality_trim.time bash quality_trim.sh)  || (rm quality_trim.time.done && false)
	touch quality_trim.time.done

extract_pairs.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh extract_pairs & time -o extract_pairs.time bash extract_pairs.sh)  || (rm extract_pairs.time.done && false)
	touch extract_pairs.time.done

trim_clean.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh trim_clean & time -o trim_clean.time bash trim_clean.sh)  || (rm trim_clean.time.done && false)
	touch trim_clean.time.done

#Part 2
diginorm_pe.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh diginorm_pe & time -o diginorm_pe.time bash diginorm_pe.sh)  || (rm diginorm_pe.time.done && false)
	touch diginorm_pe.time.done

diginorm_se.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh diginorm_se & time -o diginorm_se.time bash diginorm_se.sh)  || (rm diginorm_se.time.done && false)
	touch diginorm_se.time.done

filter-abund.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh filter-abund & time -o filter-abund.time bash filter-abund.sh)  || (rm filter-abund.time.done && false)
	touch filter-abund.time.done

diginorm_clean.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh diginorm_clean & time -o diginorm_clean.time bash diginorm_clean.sh)  || (rm diginorm_clean.time.done && false)
	touch diginorm_clean.time.done

#Part 3
trinity_split.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh trinity_split & time -o trinity_split.time bash trinity_split.sh)  || (rm trinity_split.time.done && false)
	touch trinity_split.time.done

#Change -JM 15G based on machine memory
trinity.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh trinity & time -o trinity.time bash trinity.sh $i)  || (rm trinity.time.done && false)
	touch trinity.time.done

#Part 5
khmer_part.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh khmer_part & time -o khmer_part.time bash khmer_part.sh)  || (rm khmer_part.time.done && false)
	touch khmer_part.time.done

group.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh group & time -o group.time bash group.sh)  || (rm group.time.done && false)
	touch group.time.done

format_annotate.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh format_annotate.sh & time -o format_annotate.time bash format_annotate.sh)  || (rm format_annotate.time.done && false)
	touch format_annotate.time.done

blastx.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh blastx & time -o blastx.time bash blastx.sh)  || (rm blastx.time.done && false)
	touch blastx.time.done

tblastn.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh tblastn & time -o tblastn.time bash tblastn.sh)  || (rm tblastn.time.done && false)
	touch tblastn.time.done

homology.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh homology & time -o homology.time bash homology.sh)  || (rm homology.time.done && false)
	touch homology.time.done

orthology.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh orthology & time -o orthology.time bash orthology.sh)  || (rm orthology.time.done && false)
	touch orthology.time.done

get_mouse_info.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh get_mouse_info & time -o get_mouse_info.time bash get_mouse_info.sh)  || (rm get_mouse_info.time.done && false)
	touch get_mouse_info.time.done

annotate.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh annotate & time -o annotate.time bash annotate.sh)  || (rm annotate.time.done && false)
	touch annotate.time.done

#RSEM
transcript_map.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh transcript_map & time -o transcript_map.time bash transcript_map.sh)  || (rm transcript_map.time.done && false)
	touch transcript_map.time.done

reference.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh reference & time -o reference.time bash reference.sh)  || (rm reference.time.done && false)
	touch reference.time.done

rsem.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh rsem & time -o rsem.time bash rsem.sh)  || (rm rsem.time.done && false)
	touch rsem.time.done

gene-matrix.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh gene-matrix & time -o gene-matrix.time bash gene-matrix.sh)  || (rm gene-matrix.time.done && false)
	touch gene-matrix.time.done

#Differential expression
ebseq.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh ebseq & time -o ebseq.time bash ebseq.sh)  || (rm ebseq.time.done && false)
	touch ebseq.time.done

expression.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh expression & time -o expression.time bash expression.sh)  || (rm expression.time.done && false)
	touch expression.time.done

visual.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh visual & time -o visual.time bash visual.sh)  || (rm visual.time.done && false)
	touch visual.time.done