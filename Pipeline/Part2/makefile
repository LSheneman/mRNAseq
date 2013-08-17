KHMER=/usr/local/share/khmer
#Makefile for part 2

all: benchmarks

benchmarks: diginorm_pe.sh.time
# diginorm_se.time filter-adund.time diginorm_clean.time

#Apply digital normalization to the paired-end reads
diginorm_pe.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o diginorm_pe.time bash diginorm_pe.sh

# #Apply digital normalization to the singled-end reads
# diginorm_se.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	time -o ../time/diginorm_se.time python ${KHMER}/scripts/normalize-by-median.py -k 20 -C 20 -N 4 -x 3e9 --loadhash normC20k20.kh --savehash normC20k20.kh *.se.qc.fq.gz

# #trim off low-abundance parts of high-coverage reads
# filter-adund.time:	
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	time -o ../time/filter-adund.time ${KHMER}/scripts/filter-abund.py -V normC20k20.kh *.keep
	
# #Clean up the files
# diginorm_clean.time:
# 	-echo 3 > /proc/sys/vm/drop_caches
# 	time -o ../time/diginorm_clean.time sh cleanup2.sh	