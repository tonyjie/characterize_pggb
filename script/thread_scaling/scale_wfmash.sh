# Thread scaling test for wfmash: Run wfmash with different number of threads

PANGENOME=$1 # option: "DRB1-3123" or "ecoli50"


DATASET_DIR="/work/shared/users/phd/jl4257/Course/CS6230/characterize_pggb/dataset"
FA_FILE="${DATASET_DIR}/${PANGENOME}/${PANGENOME}.fa.gz"
PAF_FILE="${DATASET_DIR}/${PANGENOME}/${PANGENOME}.fa.gz.paf"

LOG_DIR="/work/shared/users/phd/jl4257/Course/CS6230/characterize_pggb/script/thread_scaling"
LOG_FILE=${LOG_DIR}/wfmash_${PANGENOME}.log

if [ ! -d ${LOG_DIR} ]; then
    mkdir -p ${LOG_DIR}
fi


# test run time using different number of threads
thread_list=(32 16 8 4 2 1)
set -x
for num_threads in "${thread_list[@]}";
do
    echo "Running wfmash with ${num_threads} threads"
    { time wfmash \
        ${FA_FILE} \
        ${FA_FILE} \
        --threads ${num_threads} \
        -n 11 -s 5000 -p 90  -X  -l 25000 -k 19 -H 0.001 > ${PAF_FILE} ; } \
        2>&1 | tee -a ${LOG_FILE}
done