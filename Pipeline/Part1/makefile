#Make file for part 1

all: copyadapters benchmarks

copyadapters:
	curl -O https://s3.amazonaws.com/public.ged.msu.edu/illuminaClipping.fa
	
benchmarks: adapter_trim.sh.time adapter_trim.time 
#quality_trim.time extract_pairs.time trim_clean.time


adapter_trim.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/adapter_trim.sh.time python /usr/local/share/khmer/sandbox/write-trimmomatic.py > trim.sh
	touch top-output.txt
	until test -f adapter_trim.sh.time
	do
		top -n 1 -b >> top-output.txt
		sleep 300
	done

adapter_trim.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/adapter_trim.time bash trim.sh
	touch top-output2.txt
	until test -f adapter_trim.time
	do
		top -n 1 -b >> top-output2.txt
		sleep 300
	done

# quality_trim.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	time -o ../time/qualitytrim.time bash quality_trim.sh

# extract_pairs.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	time -o ../time/extract_pairs.time bash extract_pairs.sh

# trim_clean.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	time -o ../time/trim_clean.time	bash cleanup1.sh