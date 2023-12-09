# DRB1-3123
smoothxg \
    --threads=2 \
    --gfa-in=DRB1-3123.fa.gz.seqwish.gfa \
    --smoothed-out=DRB1-3123.fa.gz.smoothxg.gfa \
    -T 2 -r 12 -P 1,19,39,3,81,1 -V   -X 100 -I 0.9 -R 0 -j 0 -e 0 -l 700,900,1100 -O 0.001 -Y 1200 -d 0 -D 0


# ecoli-50
smoothxg \
    --threads=12 \
    --gfa-in=ecoli50.fa.gz.seqwish.gfa \
    --smoothed-out=ecoli50.fa.gz.smoothxg.gfa \
    -T 12 -r 50 -P 1,19,39,3,81,1 -V   -X 100 -I 0.9 -R 0 -j 0 -e 0 -l 700,900,1100 -O 0.001 -Y 5000 -d 0 -D 0