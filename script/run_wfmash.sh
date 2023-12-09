# DRB1-3123
wfmash \
    DRB1-3123.fa.gz \
    DRB1-3123.fa.gz \
     \
    --threads 2 \
     \
    -n 11 -s 5000 -p 90  -X  -l 25000 -k 19 -H 0.001 > DRB1-3123.fa.gz.paf

# ecoli-50
wfmash \
    ecoli50.fa.gz \
    ecoli50.fa.gz \
     \
    --threads 6 \
     \
    -n 49 -s 5000 -p 90  -X  -l 25000 -k 19 -H 0.001 > ecoli50.fa.gz.paf
