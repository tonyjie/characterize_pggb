# DRB1-3123
seqwish \
    --threads 2 \
    --paf-alns=DRB1-3123.fa.gz.paf \
    --seqs=DRB1-3123.fa.gz \
    --gfa=DRB1-3123.fa.gz.seqwish.gfa \
    -k 19 -f 0 -B 10000000 -P

# ecoli-50
seqwish \
    --threads 6 \
    --paf-alns=ecoli50.fa.gz.paf \
    --seqs=ecoli50.fa.gz \
    --gfa=ecoli50.fa.gz.seqwish.gfa \
    -k 19 -f 0 -B 10000000 -P
