KHMER=/usr/local/share/khmer

python ${KHMER}/scripts/normalize-by-median.py -p -k 20 -C 20 -N 4 -x 3e9 --savehash normC20k20.kh *.pe.qc.fq.gz &
touch diginorm_pe.sh.mp.txt , diginorm_pe.sh.vm.txt
until [ -f diginorm_pe.sh.time ]
do
	mpstat -P ALL 1 2 | tail -5 >> diginorm_pe.sh.mp.txt
	vmstat 1 2 | tail -1 >> diginorm_pe.sh.vm.txt
	sleep 5
done