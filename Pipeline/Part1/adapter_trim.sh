python /usr/local/share/khmer/sandbox/write-trimmomatic.py > trim.sh
	touch top-output.txt
	while [ ! -f time/adapter_trim.sh.time]
	do
		top -n 1 -b >> top-output.txt
		sleep 5
	done