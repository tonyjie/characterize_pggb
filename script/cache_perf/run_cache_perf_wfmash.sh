# use Perf to check cache performance
PERF_COMMAND="perf stat -e cycles,cycle_activity.stalls_mem_any,cycle_activity.stalls_total \
                -e cache-misses,cache-references,L1-dcache-loads,L1-dcache-load-misses,L1-dcache-stores \
                -e LLC-loads,LLC-load-misses,LLC-stores,LLC-store-misses"

PANGENOME=$1 # option: "DRB1-3123" or "ecoli50" or "scerevisiae8"

# if others, echo error message and exit
if [ ${PANGENOME} != "DRB1-3123" ] && [ ${PANGENOME} != "ecoli50" ] && [ ${PANGENOME} != "scerevisiae8"] ; then
    echo "Error: PANGENOME should be DRB1-3123 or ecoli50 or scerevisiae8"
    exit 1
fi

DATASET_DIR="/work/shared/users/phd/jl4257/Course/CS6230/characterize_pggb/dataset"
FA_FILE="${DATASET_DIR}/${PANGENOME}/${PANGENOME}.fa.gz"
PAF_FILE="${DATASET_DIR}/${PANGENOME}/${PANGENOME}.fa.gz.paf"

LOG_DIR="/work/shared/users/phd/jl4257/Course/CS6230/characterize_pggb/script/cache_perf"
LOG_FILE=${LOG_DIR}/wfmash_${PANGENOME}.log

if [ ! -d ${LOG_DIR} ]; then
    mkdir -p ${LOG_DIR}
fi

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

set -x
${PERF_COMMAND} bash -c "${program}> ${PAF_FILE}" 2>&1 | tee -a ${LOG_FILE}