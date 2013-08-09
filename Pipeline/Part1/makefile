KHMER=/usr/local/share/khmer
#Make file for part 1

all: copyadapters benchmarks

copyadapters:
	curl -O https://s3.amazonaws.com/public.ged.msu.edu/illuminaClipping.fa
	
benchmarks: adapter_trim.sh.time adapter_trim.time quality_trim.time extract_pairs.time trim_clean.time


adapter_trim.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/adapter_trim.sh.time python ${KHMER}/sandbox/write-trimmomatic.py > trim.sh

adapter_trim.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/adapter_trim.time bash trim.sh

quality_trim.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/qualitytrim.time sh quality_trim.sh

extract_pairs.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/extract_pairs.time sh extract_pairs.sh

trim_clean.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/trim_clean.time	sh trim_clean.sh