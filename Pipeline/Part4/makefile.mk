all: benchmarks

benchmarks: format_db.time

format_db.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/format_db.time sh blasting.sh