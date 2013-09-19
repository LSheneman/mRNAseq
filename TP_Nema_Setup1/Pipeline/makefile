#Make file for Trinity Nature protocol
TRINITY_HOME = /root/trinityrnaseq_r2013_08_14
KHMER = /usr/local/share/khmer

benchmarks: trinity.time quality_report.time db_reference.time \
	align_transcripts.time coverage.time align_reads.time sense_strands.time \
	log_rsem.time shift_rsem.time shock_rsem.time plateau_rsem.time \
	expected_count.time differentially.time length_trans.time normalize.time \
	extraction.time cluster.time

#trim from Eel (part 1)
trinity.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh trinity & time -o trinity.time /root/trinityrnaseq_r2013_08_14/Trinity.pl --seqType fq --JM 10G --left left.fq --right right.fq --SS_lib_type RF --CPU 6
	touch trinity.time.done

quality_report.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh quality_report & time -o quality_report.time /root/trinityrnaseq_r2013_08_14/util/TrinityStats.pl trinity_out_dir/Trinity.fasta
	touch quality_report.time.done

db_reference.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh db_reference & time -o db_reference.time makeblastdb -in S_pombe_refTrans.fasta -dbtype nucl
	touch db_reference.time.done

align_transcripts.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh align_transcripts & time -o align_transcripts.time blastn -query trinity_out_dir/Trinity.fasta -db S_pombe_refTrans.fasta -out Trinity_vs_S_pombe_refTrans.blastn -evalue 1e-20 -dust no -task megablast -num_threads 2 -max_target_seqs 1 -outfmt 6
	touch align_transcripts.time.done

coverage.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh coverage & time -o coverage.time /root/trinityrnaseq_r2013_08_14/util/analyze_blastPlus_topHit_coverage.pl Trinity_vs_S_pombe_genes.blastn trinity_out_dir/Trinity.fasta S_pombe_refTrans.fasta
	touch coverage.time.done

align_reads.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh align_reads & time -o align_reads.time /root/trinityrnaseq_r2013_08_14/util/alignReads.pl --seqType fq --left reads.ALL.left.fq --right reads.ALL.right.fq --SS_lib_type RF --retain_intermediate_files --aligner bowtie --target trinity_out_dir/Trinity.fasta -- -p 4
	touch align_reads.time.done

sense_strands.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh sense_strands & time -o sense_strands.time /root/trinityrnaseq_r2013_08_14/util/SAM_nameSorted_to_uniq_count_stats.pl bowtie_out/bowtie_out.nameSorted.sam. + .sam
	touch sense_strands.time.done

log_rsem.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh log_rsem & time -o log_rsem.time /root/trinityrnaseq_r2013_08_14/util/RSEM_util/run_RSEM_align_n_estimate.pl --transcripts trinity_out_dir/Trinity.fasta --left Sp.log.1M.left.fq --right Sp.log.1M.right.fq --seqType fq --SS_lib_type RF --prefix LOG
	touch log_rsem.time.done

shift_rsem.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh shift_rsem & time -o shift_rsem.time /root/trinityrnaseq_r2013_08_14/util/RSEM_util/run_RSEM_align_n_estimate.pl --transcripts trinity_out_dir/Trinity.fasta --left Sp.ds.1M.left.fq --right Sp.ds.1M.right.fq --seqType fq --SS_lib_type RF --prefix DS
	touch shift_rsem.time.done

shock_rsem.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh shock_rsem & time -o shock_rsem.time /root/trinityrnaseq_r2013_08_14/util/RSEM_util/run_RSEM_align_n_estimate.pl --transcripts trinity_out_dir/Trinity.fasta --left Sp.hs.1M.left.fq --right Sp.hs.1M.right.fq --seqType fq --SS_lib_type RF --prefix HS
	touch shock_rsem.time.done

plateau_rsem.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh plateau_rsem & time -o plateau_rsem.time /root/trinityrnaseq_r2013_08_14/util/RSEM_util/run_RSEM_align_n_estimate.pl --transcripts trinity_out_dir/Trinity.fasta --left Sp.plat.1M.left.fq --right Sp.plat.1M.right.fq --seqType fq --SS_lib_type RF --prefix PLAT
	touch plateau_rsem.time.done

expected_count.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh expected_count & time -o expected_count.time /root/trinityrnaseq_r2013_08_14/util/RSEM_util/merge_RSEM_frag_counts_single_table.pl LOG.isoforms.results DS.isoforms.results HS.isoforms.results PLAT.isoforms.results > Sp_isoforms.counts.matrix
	touch expected_count.time.done

differentially.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh differentially & time -o differentially.time /root/trinityrnaseq_r2013_08_14/Analysis/DifferentialExpression/run_DE_analysis.pl --matrix Sp_isoforms.counts.matrix --method edgeR --output edgeR_dir
	touch differentially.time.done

length_trans.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh length_trans & time -o length_trans.time cut -f1,3,4 DS.isoforms.results > Trinity.trans_lengths.txt
	touch length_trans.time.done

normalize.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh normalize & time -o normalize.time /root/trinityrnaseq_r2013_08_14/Analysis/DifferentialExpression/run_TMM_normalization_write_FPKM_matrix.pl --matrix Sp_isoforms.counts.matrix --lengths Trinity.trans_lengths.txt
	touch normalize.time.done

extraction.time:
	-echo 3 > /proc/sys/vm/drop_caches
	cd edgeR_dir/
	bash stats.sh extraction & time -o extraction.time /root/trinityrnaseq_r2013_08_14/Analysis/DifferentialExpression/analyze_diff_expr.pl --matrix ./Sp_isoforms.counts.matrix.TMM_normalized.FPKM -C 2 -P 0.001
	wc -l diffExpr.P0.001_C2.matrix
	touch extraction.time.done

cluster.time:
	-echo 3 > /proc/sys/vm/drop_caches
	bash stats.sh cluster & time -o cluster.time /root/trinityrnaseq_r2013_08_14/Analysis/DifferentialExpression/define_clusters_by_cutting_tree.pl --Ptree 20 -R diffExpr.P0.001_C2.matrix.R.all.Rdata
	touch cluster.time.done
