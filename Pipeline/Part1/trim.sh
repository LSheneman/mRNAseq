	bash trim.sh
	touch adapter_trim.time.txt
	while [ ! -f time/adapter_trim.time ]
	do
		mpstat -P ALL 1 1 >> adapter_trim.time.txt
		sleep 5
	done