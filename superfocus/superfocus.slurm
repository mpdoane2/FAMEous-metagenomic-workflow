#!/bin/bash

#SBATCH --job-name=sawshark-superfocus
#SBATCH --output=%x-%j.out.txt
#SBATCH --error=%x-%j.err.txt
#SBATCH --time=4-0
#SBATCH --ntasks=16
#SBATCH --cpus-per-task=1
#SBATCH --mem=200G

export SUPERFOCUS_DB=/scratch/user/doan0033/database/superfocus_mmseqsDB/mmseqs2
for f in `cat ../sample-names.txt`; do

superfocus -q ../QC/"$f"_prinseq_good_out_R1.fastq -q ../QC/"$f"_prinseq_good_R2.fastq -dir "$f"_superfocus -a mmseqs2 -t 16 -n 0

done
