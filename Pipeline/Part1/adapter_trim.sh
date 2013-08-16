	python /usr/local/share/khmer/sandbox/write-trimmomatic.py > trim.sh
	touch top-output.txt
	while [ ! -f time/adapter_trim.sh.time ]
	do
		mpstat -P ALL 1 1 >> top-output.txt
		sleep 5
	done
