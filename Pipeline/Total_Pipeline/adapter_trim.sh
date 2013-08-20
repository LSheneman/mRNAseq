progress
{
/usr/bin/time -o adapter_trim.time python /usr/local/share/khmer/sandbox/write-trimmomatic.py > trim.sh
done
}

progress() &
touch trim_run.time.mp.txt , trim_run.time.vm.txt
until [ -f adapter_trim.time ]
touch adapter_trim.time.mp.txt , adapter_trim.time.vm.txt
until [ -f ../time/adapter_trim.time ]
do
	mpstat -P ALL 1 2 | tail -6 >> ../output/adapter_trim.time.mp.txt
	vmstat 1 2 | (head -2; tail -1) | tail -2 >> ../output/adapter_trim.time.vm.txt
	sleep 5
done