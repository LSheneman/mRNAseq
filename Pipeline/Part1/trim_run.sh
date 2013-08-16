	bash trim.sh
	touch trim_run.sh.time.txt
	while [ ! -f time/trim_run.sh.time ]
	do
		mpstat -P ALL 1 1 >> trim_run.sh.time.txt
		sleep 5
	done