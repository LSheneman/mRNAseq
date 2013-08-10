all: benchmarks

benchmarks: trinity_split.time trinity.time

trinity_split.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/trinity_split.time sh split.sh

#Change -JM 15G based on machine memory
trinity.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/trinity.time /root/trinityrnaseq_r2013-02-25/Trinity.pl --left left.fq --right right.fq --seqType fq -JM 15G
	
