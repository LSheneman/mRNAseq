all: benchmarks

benchmarks: trinity_split.sh.time trinity.time

trinity_split.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/trinity_split.sh.time sh split.sh  &
	 bash statOutput.sh trinity_split.sh.time

#Change -JM 15G based on machine memory
trinity.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/trinity.time /root/trinityrnaseq_r2013-02-25/Trinity.pl --left left.fq --right right.fq --seqType fq -JM 15G  &
	 bash statOutput.sh trinity.time
	
