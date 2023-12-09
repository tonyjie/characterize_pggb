# DRB1-3123
DATASET_DIR="/work/shared/users/phd/jl4257/Course/CS6230/characterize_pggb/dataset"
DRB1_3123_FA="${DATASET_DIR}/DRB1-3123/DRB1-3123.fa.gz"
DRB1_3123_PAF="${DATASET_DIR}/DRB1-3123/DRB1-3123.fa.gz.paf"

wfmash \
    ${DRB1_3123_FA} \
    ${DRB1_3123_FA} \
     \
    --threads 2 \
     \
    -n 11 -s 5000 -p 90  -X  -l 25000 -k 19 -H 0.001 > ${DRB1_3123_PAF}

ECOLI50_FA="${DATASET_DIR}/ecoli-50/ecoli-50.fa.gz"
ECOLI50_PAF="${DATASET_DIR}/ecoli-50/ecoli-50.fa.gz.paf"
# ecoli-50
wfmash \
    ${ECOLI50_FA} \
    ${ECOLI50_FA} \
     \
    --threads 6 \
     \
    -n 49 -s 5000 -p 90  -X  -l 25000 -k 19 -H 0.001 > ${ECOLI50_PAF}
