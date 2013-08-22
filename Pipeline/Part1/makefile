#Make file for part 1

all: copyadapters benchmarks

copyadapters:
	curl -O https://s3.amazonaws.com/public.ged.msu.edu/illuminaClipping.fa
	
benchmarks: adapter_trim.sh.time trim_run.sh.time quality_trim.time 
	extract_pairs.time trim_clean.time 


adapter_trim.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o time/adapter_trim.time bash python /usr/local/share/khmer/sandbox/write-trimmomatic.py > trim.sh &
	 bash statOutput.sh adapter_trim.time

trim_run.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/trim_run.time bash trim.sh &
	 bash statOutput.sh trim_run.time

quality_trim.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/qualitytrim.time bash quality_trim.sh &
	 bash statOutput.sh diginorm_pe.sh.time

extract_pairs.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/extract_pairs.time bash extract_pairs.sh &
	 bash statOutput.sh diginorm_pe.sh.time

trim_clean.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/trim_clean.time	bash trim_clean.sh &
	 bash statOutput.sh diginorm_pe.sh.time