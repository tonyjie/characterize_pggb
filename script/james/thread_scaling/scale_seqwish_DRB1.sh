#!/bin/bash

# Array of thread counts
threads=(2 4 8 16 32)

# Loop over the thread counts
for t in "${threads[@]}"
do
    # Define the result directory for VTune based on thread count
    RESULT_DIR="DRB1/perf_result_$t"
    SUMMARY_FILE="${RESULT_DIR}/seqwish_performance_summary_thread_$t.txt"

    # Run seqwish with VTune profiling
    vtune -collect performance-snapshot -result-dir ${RESULT_DIR} -- ./seqwish --threads $t --paf-alns=/home/bc526/characterize_pggb/dataset/DRB1-3123/DRB1-3123.fa.gz.paf --seqs=/home/bc526/characterize_pggb/dataset/DRB1-3123/DRB1-3123.fa.gz --gfa=DRB1-3123.fa.gz.seqwish.gfa -k 19 -f 0 -B 10000000 -P

    # Generate VTune summary report
    vtune -report summary -result-dir ${RESULT_DIR} -report-output ${SUMMARY_FILE}
done
