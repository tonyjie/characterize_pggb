# Thread scaling test for wfmash: Run wfmash with different number of threads

PANGENOME=$1 # option: "DRB1-3123" or "ecoli50"

# if others, echo error message and exit
if [ ${PANGENOME} != "DRB1-3123" ] && [ ${PANGENOME} != "ecoli50" ]; then
    echo "Error: PANGENOME should be DRB1-3123 or ecoli50"
    exit 1
fi


DATASET_DIR="/work/shared/users/phd/jl4257/Course/CS6230/characterize_pggb/dataset"
FA_FILE="${DATASET_DIR}/${PANGENOME}/${PANGENOME}.fa.gz"
PAF_FILE="${DATASET_DIR}/${PANGENOME}/${PANGENOME}.fa.gz.paf"

LOG_DIR="/work/shared/users/phd/jl4257/Course/CS6230/characterize_pggb/script/thread_scaling"
LOG_FILE=${LOG_DIR}/wfmash_${PANGENOME}.log

# if LOG_FILE exists, remove it
if [ -f ${LOG_FILE} ]; then
    rm ${LOG_FILE}
fi

# test run time using different number of threads
thread_list=(32 16 8 4 2 1)

# if PANGENOME="DRB1-3123"
if [ ${PANGENOME} = "DRB1-3123" ]; then
    # DRB1-3123
    for num_threads in "${thread_list[@]}";
    do
        echo "========= Running wfmash with ${num_threads} threads =========" 2>&1 | tee -a ${LOG_FILE}
        { time wfmash \
            ${FA_FILE} \
            ${FA_FILE} \
            --threads ${num_threads} \
            -n 11 -s 5000 -p 90  -X  -l 25000 -k 19 -H 0.001 > ${PAF_FILE} ; } \
            2>&1 | tee -a ${LOG_FILE}
    done
fi

# if PANGENOME="ecoli50"
if [ ${PANGENOME} = "ecoli50" ]; then
    # ecoli-50
    for num_threads in "${thread_list[@]}";
    do
        echo "Running wfmash with ${num_threads} threads"
        { time wfmash \
            ${FA_FILE} \
            ${FA_FILE} \
            --threads ${num_threads} \
            -n 49 -s 5000 -p 90  -X  -l 25000 -k 19 -H 0.001 > ${PAF_FILE} ; } \
            2>&1 | tee -a ${LOG_FILE}
    done
fi

