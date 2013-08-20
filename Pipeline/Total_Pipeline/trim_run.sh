progress()
{
/usr/bin/time -o ../time/trim_run.sh.time bash trim.sh
}

stats()
{
	touch trim_run.sh.mp.txt , trim_run.sh.vm.txt
	until [ -f ../time/trim_run.sh.time ]
	do
		mpstat -P ALL 1 2 | tail -6 >> ../output/trim_run.sh.mp.txt
		vmstat 1 2 | (head -2; tail -1) | tail -2 >> ../output/trim_run.sh.vm.txt
		sleep 5
	done
}

coproc stats progess
echo "done"