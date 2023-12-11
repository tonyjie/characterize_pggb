#!/bin/bash

# Thread scaling test for seqwish: Run seqwish with different number of threads

# option: "DRB1-3123" or "ecoli50"
PANGENOME="DRB1-3123"  # Set to either "DRB1-3123" or "ecoli50"

# If others, echo error message and exit

DATASET_DIR="/home/bc526/characterize_pggb/dataset"
FA_FILE="${DATASET_DIR}/${PANGENOME}/${PANGENOME}.fa.gz"
PAF_FILE="${DATASET_DIR}/${PANGENOME}/${PANGENOME}.fa.gz.paf"

LOG_DIR="/home/bc526/characterize_pggb/script/thread_scaling"
LOG_FILE="${LOG_DIR}/smoothxg_${PANGENOME}.log"

if [ ! -d "${LOG_DIR}" ]; then
    mkdir -p "${LOG_DIR}"
fi

# Test run time using different number of threads
thread_list=(32 16 8 4)


# if PANGENOME="DRB1-3123"

# if PANGENOME="DRB1-3123"
if [ "${PANGENOME}" = "DRB1-3123" ]; then
    # DRB1-3123
    for num_threads in "${thread_list[@]}"; do
        echo "========= Running seqwish with ${num_threads} threads ========="
        { time ./smoothxg  \
    --threads=${num_threads} \
    --gfa-in=/home/bc526/characterize_pggb/dataset/DRB1-3123/DRB1-3123.fa.gz.smoothxg.gfa\
    --smoothed-out=DRB1-3123.fa.gz.smoothxg.gfa \
    -T 2 -r 12 -P 1,19,39,3,81,1 -V   -X 100 -I 0.9 -R 0 -j 0 -e 0 -l 700,900,1100 -O 0.001 -Y 1200 -d 0 -D 0 ; } \
            2>&1 | tee -a "${LOG_FILE}"
    done
fi

# # if PANGENOME="ecoli50"
# if [ "${PANGENOME}" = "ecoli50" ]; then
#     # ecoli-50
#     for num_threads in "${thread_list[@]}"; do
#         echo "========= Running seqwish with ${num_threads} threads ========="
#         { time ./seqwish \
#             --paf-alns="${PAF_FILE}" \
#             --seqs="${FA_FILE}" \
#             --threads ${num_threads} \
#             --gfa=ecoli50.fa.gz.seqwish.gfa \
#             -k 19 -f 0 -B 10000000 -P ; } \
#             2>&1 | tee -a "${LOG_FILE}"
#     done
# fi

