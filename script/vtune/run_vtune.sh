# Use Intel Vtune Profiler to do top-down microarchitecture analysis

PANGENOME=$1 # option: "DRB1-3123" or "ecoli50" or "scerevisiae8"

# if others, echo error message and exit
if [ ${PANGENOME} != "DRB1-3123" ] && [ ${PANGENOME} != "ecoli50" ] && [ ${PANGENOME} != "scerevisiae8"] ; then
    echo "Error: PANGENOME should be DRB1-3123 or ecoli50 or scerevisiae8"
    exit 1
fi

DATASET_DIR="/work/shared/users/phd/jl4257/Course/CS6230/characterize_pggb/dataset"
FA_FILE="${DATASET_DIR}/${PANGENOME}/${PANGENOME}.fa.gz"
PAF_FILE="${DATASET_DIR}/${PANGENOME}/${PANGENOME}.fa.gz.paf"

NUM_THREADS=32
# if PANGENOME="DRB1-3123"
if [ ${PANGENOME} = "DRB1-3123" ]; then
    # DRB1-3123
    program="wfmash \
        ${FA_FILE} \
        ${FA_FILE} \
        --threads ${NUM_THREADS} \
        -n 11 -s 5000 -p 90  -X  -l 25000 -k 19 -H 0.001"
fi

# if PANGENOME="ecoli50"
if [ ${PANGENOME} = "ecoli50" ]; then
    # ecoli-50
    program="wfmash \
        ${FA_FILE} \
        ${FA_FILE} \
        --threads ${NUM_THREADS} \
        -n 49 -s 5000 -p 90  -X  -l 25000 -k 19 -H 0.001"
fi

# if PANGENOME="scerevisiae8"
if [ ${PANGENOME} = "scerevisiae8" ]; then
    # scerevisiae8
    program="wfmash \
        ${FA_FILE} \
        ${FA_FILE} \
        --threads ${NUM_THREADS} \
        -n 7 -s 5000 -p 90  -X  -l 25000 -k 19 -H 0.001"
fi

RESULT_DIR="/work/shared/users/phd/jl4257/Course/CS6230/characterize_pggb/script/vtune/${PANGENOME}"
SUMMARY_FILE="${RESULT_DIR}/wfmash_${PANGENOME}.rpt"

set -x
# Performance-snapshot
vtune -collect performance-snapshot -result-dir ${RESULT_DIR} -- bash -c "${program} > ${PAF_FILE}"
vtune -report summary -result-dir ${RESULT_DIR} -report-output ${SUMMARY_FILE}