
threads=(32 16 8 4)


for t in "${threads[@]}"
do
  
    RESULT_DIR="new_data/perf_result_$t"
    SUMMARY_FILE="${RESULT_DIR}/seqwish_performance_summary_thread_$t.txt"

  
    vtune -collect performance-snapshot -result-dir ${RESULT_DIR} -- ./seqwish --threads $t --paf-alns=/home/bc526/characterize_pggb/dataset/scerevisiae8/scerevisiae8.fa.gz.paf --seqs=/home/bc526/characterize_pggb/dataset/scerevisiae8/scerevisiae8.fa.gz --gfa=DRB1-3123.fa.gz.scerevisiae8.gfa -k 19 -f 0 -B 10000000 -P

    vtune -report summary -result-dir ${RESULT_DIR} -report-output ${SUMMARY_FILE}
done
