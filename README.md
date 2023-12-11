# Characterizing the Parallel Motifs of the Pangenomics Analysis Pipeline

Conduct detailed workload characterization on the pangenomics analysis pipeline [PGGB](https://github.com/pangenome/pggb). 


## Dataset
- [DRB1-3123](https://drive.google.com/drive/folders/1kXf03zkLBR2kPF_bglhIjvq9gIOf-tPY?usp=drive_link)
- [ecoli50](https://drive.google.com/drive/folders/16GNCvQbUJbCYHywqjQxF3DRxb-Krf5Zu?usp=drive_link) 
- [scerevisiae8](https://drive.google.com/drive/folders/1GcdUm-SrkCwjQuxiPx2rv10blK2IRLH_?usp=drive_link)

You can use `wget` to download all the files under the directory into `./dataset`. 
You will need them if you want to run each individual stage on your own. 

## Build
You need to build each individual stage. 

The stages are
- [`wfmash`](https://github.com/waveygang/wfmash)
- [`seqwish`](https://github.com/ekg/seqwish)
- [`smoothxg`](https://github.com/pangenome/smoothxg)

Follow their build instructions and build each stage. 
Then with the correct directory configuration, you will be able to characterize these workloads. 
