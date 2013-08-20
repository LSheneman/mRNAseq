progress
{
/usr/bin/time -o ../time/adapter_trim.time python /usr/local/share/khmer/sandbox/write-trimmomatic.py > trim.sh
}

progress() &
touch adapter_trim.mp.txt , adapter_trim.vm.txt
until [ -f ../time/adapter_trim.time ]
do
	mpstat -P ALL 1 2 | tail -6 >> ../output/adapter_trim.mp.txt
	vmstat 1 2 | (head -2; tail -1) | tail -2 >> ../output/adapter_trim.vm.txt
	sleep 5
done