all: benchmarks

benchmarks: format_db.sh.time

format_db.sh.time:
	-echo 3 > /proc/sys/vm/drop_caches
	time -o ../time/format_db.sh.time sh blasting.sh  &
	bash statOutput.sh format_db.sh.time