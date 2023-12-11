# use Perf to check cache performance
PERF_COMMAND="perf stat -e cycles,cycle_activity.stalls_mem_any,cycle_activity.stalls_total \
                -e cache-misses,cache-references,L1-dcache-loads,L1-dcache-load-misses,L1-dcache-stores \
                -e LLC-loads,LLC-load-misses,LLC-stores,LLC-store-misses"
# option: "DRB1-3123" or "ecoli50"

PANGENOME="DRB1-3123"  

# if others, echo error message and exit

if [ ${PANGENOME} != "DRB1-3123" ] && [ ${PANGENOME} != "ecoli50" ]; then
    echo "Error: PANGENOME should be DRB1-3123 or ecoli50"
    exit 1
fi

DATASET_DIR="/home/bc526/characterize_pggb/dataset"
FA_FILE="${DATASET_DIR}/${PANGENOME}/${PANGENOME}.fa.gz"
PAF_FILE="${DATASET_DIR}/${PANGENOME}/${PANGENOME}.fa.gz.paf"

LOG_DIR="/home/bc526/characterize_pggb/script/cache_perf_drb1"
LOG_FILE=${LOG_DIR}/seqwish_${PANGENOME}.log

if [ ! -d ${LOG_DIR} ]; then
    mkdir -p ${LOG_DIR}
fi

NUM_THREADS=32

# if PANGENOME="DRB1-3123"
if [ ${PANGENOME} = "DRB1-3123" ]; then
    # DRB1-3123
    program="./seqwish \
        --paf-alns="${PAF_FILE}" \
        --seqs="${FA_FILE}" \
        --threads ${NUM_THREADS} \

        -k 19 -f 0 -B 10000000 -P"
fi




# if PANGENOME="ecoli50"
if [ ${PANGENOME} = "ecoli50" ]; then
    # ecoli-50
    program="./seqwish \
        --paf-alns="${PAF_FILE}" \
        --seqs="${FA_FILE}" \
        --threads ${NUM_THREADS} \

        -k 19 -f 0 -B 10000000 -P"
fi

set -x
${PERF_COMMAND}  ${program} 2>&1 | tee -a ${LOG_FILE}