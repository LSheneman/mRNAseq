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
	(bash stats.sh adapter_trim & time -o adapter_trim.time bash adapter_trim.sh) || (rm adapter_trim.time && false)
	touch adapter_trim.time.done
	"DONE" >> adapter_trim.mp.txt
	"DONE" >> adapter_trim.vm.txt

trim_run.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh trim_run.sh & time -o trim_run.time bash trim.sh)  || (rm trim_run.time && false)
	touch trim_run.time.done
	"DONE" >> trim_run.mp.txt
	"DONE" >> trim_run.vm.txt

quality_trim.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh quality_trim & time -o quality_trim.time bash quality_trim.sh)  || (rm quality_trim.time && false)
	touch quality_trim.time.done
	"DONE" >> quality_trim.mp.txt
	"DONE" >> quality_trim.vm.txt

extract_pairs.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh extract_pairs & time -o extract_pairs.time bash extract_pairs.sh)  || (rm extract_pairs.time && false)
	touch extract_pairs.time.done
	"DONE" >> extract_pairs.mp.txt
	"DONE" >> extract_pairs.vm.txt

trim_clean.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh trim_clean & time -o trim_clean.time bash trim_clean.sh)  || (rm trim_clean.time && false)
	touch trim_clean.time.done
	"DONE" >> trim_clean.mp.txt
	"DONE" >> trim_clean.vm.txt

#Part 2
diginorm_pe.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh diginorm_pe & time -o diginorm_pe.time bash diginorm_pe.sh)  || (rm diginorm_pe.time && false)
	touch diginorm_pe.time.done
	"DONE" >> diginorm_pe.mp.txt
	"DONE" >> diginorm_pe.vm.txt

diginorm_se.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh diginorm_se & time -o diginorm_se.time bash diginorm_se.sh)  || (rm diginorm_se.time && false)
	touch diginorm_se.time.done
	"DONE" >> diginorm_se.mp.txt
	"DONE" >> diginorm_se.vm.txt

filter-abund.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh filter-abund & time -o filter-abund.time bash filter-abund.sh)  || (rm filter-abund.time && false)
	touch filter-abund.time.done
	"DONE" >> filter-abund.mp.txt
	"DONE" >> filter-abund.vm.txt

diginorm_clean.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh diginorm_clean & time -o diginorm_clean.time bash diginorm_clean.sh)  || (rm diginorm_clean.time && false)
	touch diginorm_clean.time.done
	"DONE" >> diginorm_clean.mp.txt
	"DONE" >> diginorm_clean.vm.txt

#Part 3
trinity_split.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh trinity_split & time -o trinity_split.time bash trinity_split.sh)  || (rm trinity_split.time && false)
	touch trinity_split.time.done
	"DONE" >> trinity_split.mp.txt
	"DONE" >> trinity_split.vm.txt

#Change -JM 15G based on machine memory
trinity.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh trinity & time -o trinity.time bash trinity.sh $i)  || (rm trinity.time && false)
	touch trinity.time.done
	"DONE" >> trinity.mp.txt
	"DONE" >> trinity.vm.txt

#Part 5
khmer_part.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh khmer_part & time -o khmer_part.time bash khmer_part.sh)  || (rm khmer_part.time && false)
	touch khmer_part.time.done
	"DONE" >> khmer_part.mp.txt
	"DONE" >> khmer_part.vm.txt

group.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh group & time -o group.time bash group.sh)  || (rm group.time && false)
	touch group.time.done
	"DONE" >> group.mp.txt
	"DONE" >> group.vm.txt

format_annotate.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh format_annotate.sh & time -o format_annotate.time bash format_annotate.sh)  || (rm format_annotate.time && false)
	touch format_annotate.time.done
	"DONE" >> format_annotate.mp.txt
	"DONE" >> format_annotate.vm.txt

blastx.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh blastx & time -o blastx.time bash blastx.sh)  || (rm blastx.time && false)
	touch blastx.time.done
	"DONE" >> blastx.mp.txt
	"DONE" >> blastx.vm.txt

tblastn.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh tblastn & time -o tblastn.time bash tblastn.sh)  || (rm tblastn.time && false)
	touch tblastn.time.done
	"DONE" >> tblastn.mp.txt
	"DONE" >> tblastn.vm.txt

homology.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh homology & time -o homology.time bash homology.sh)  || (rm homology.time && false)
	touch homology.time.done
	"DONE" >> homology.mp.txt
	"DONE" >> homology.vm.txt

orthology.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh orthology & time -o orthology.time bash orthology.sh)  || (rm orthology.time && false)
	touch orthology.time.done
	"DONE" >> orthology.mp.txt
	"DONE" >> orthology.vm.txt

get_mouse_info.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh get_mouse_info & time -o get_mouse_info.time bash get_mouse_info.sh)  || (rm get_mouse_info.time && false)
	touch get_mouse_info.time.done
	"DONE" >> get_mouse_info.mp.txt
	"DONE" >> get_mouse_info.vm.txt

annotate.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh annotate & time -o annotate.time bash annotate.sh)  || (rm annotate.time && false)
	touch annotate.time.done
	"DONE" >> annotate.mp.txt
	"DONE" >> annotate.vm.txt

#RSEM
transcript_map.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh transcript_map & time -o transcript_map.time bash transcript_map.sh)  || (rm transcript_map.time && false)
	touch transcript_map.time.done
	"DONE" >> transcript_map.mp.txt
	"DONE" >> transcript_map.vm.txt

reference.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh reference & time -o reference.time bash reference.sh)  || (rm reference.time && false)
	touch reference.time.done
	"DONE" >> reference.mp.txt
	"DONE" >> reference.vm.txt

rsem.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh rsem & time -o rsem.time bash rsem.sh)  || (rm rsem.time && false)
	touch rsem.time.done
	"DONE" >> rsem.mp.txt
	"DONE" >> rsem.vm.txt

gene-matrix.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh gene-matrix & time -o gene-matrix.time bash gene-matrix.sh)  || (rm gene-matrix.time && false)
	touch gene-matrix.time.done
	"DONE" >> gene-matrix.mp.txt
	"DONE" >> gene-matrix.vm.txt

#Differential expression
ebseq.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh ebseq & time -o ebseq.time bash ebseq.sh)  || (rm ebseq.time && false)
	touch ebseq.time.done
	"DONE" >> ebseq.mp.txt
	"DONE" >> ebseq.vm.txt

expression.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh expression & time -o expression.time bash expression.sh)  || (rm expression.time && false)
	touch expression.time.done
	"DONE" >> expression.mp.txt
	"DONE" >> expression.vm.txt

visual.time:
	-echo 3 > /proc/sys/vm/drop_caches
	(bash stats.sh visual & time -o visual.time bash visual.sh)  || (rm visual.time && false)
	touch visual.time.done
	"DONE" >> visual.mp.txt
	"DONE" >> visual.vm.txt