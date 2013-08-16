	touch top-output.txt
	while [ ! -f time/adapter_trim.sh.time ]
	do
		mpstat -P all >> top-output.txt
		sleep 5
	done
	python /usr/local/share/khmer/sandbox/write-trimmomatic.py > trim.sh