# DRB1-3123
DATASET_DIR="/work/shared/users/phd/jl4257/Course/CS6230/characterize_pggb/dataset"
DRB1_3123_FA="${DATASET_DIR}/DRB1-3123/DRB1-3123.fa.gz"
DRB1_3123_PAF="${DATASET_DIR}/DRB1-3123/DRB1-3123.fa.gz.paf"
DRB1_3123_GFA="${DATASET_DIR}/DRB1-3123/DRB1-3123.fa.gz.seqwish.gfa"

SEQWISH_BIN="/work/shared/users/phd/jl4257/Course/CS6230/seqwish/bin/seqwish"

# ${SEQWISH_BIN} \
#     --threads 2 \
#     --paf-alns=${DRB1_3123_PAF} \
#     --seqs=${DRB1_3123_FA} \
#     --gfa=${DRB1_3123_GFA} \
#     -k 19 -f 0 -B 10000000 -P

# ecoli50
ECOLI50_FA="${DATASET_DIR}/ecoli50/ecoli50.fa.gz"
ECOLI50_PAF="${DATASET_DIR}/ecoli50/ecoli50.fa.gz.paf"
ECOLI50_GFA="${DATASET_DIR}/ecoli50/ecoli50.fa.gz.seqwish.gfa"

${SEQWISH_BIN} \
    --threads 6 \
    --paf-alns=${ECOLI50_PAF} \
    --seqs=${ECOLI50_FA} \
    --gfa=${ECOLI50_GFA} \
    -k 19 -f 0 -B 10000000 -P

# scerevisiae8
seqwish \
    --threads 6 \
    --paf-alns=scerevisiae8.fa.gz.paf \
    --seqs=scerevisiae8.fa.gz \
    --gfa=scerevisiae8.fa.gz.seqwish.gfa \
    -k 19 -f 0 -B 10000000 -P