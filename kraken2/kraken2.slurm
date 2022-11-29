#!/bin/bash

#SBATCH --job-name=kraken2
#SBATCH --output=%x-%j.out.txt
#SBATCH --error=%x-%j.err.txt
#SBATCH --time=1-0
#SBATCH --ntasks=16
#SBATCH --cpus-per-task=1
#SBATCH --mem=200G

export KRAKEN_DB=/scratch/user/doan0033/database/kraken2db

for f in `cat ../sample-names.txt`; do

kraken2 --db $KRAKEN_DB ../QC/"$f"_prinseq_good_out_R1.fastq\
        --threads 16 --use-names \
        --report "$f"_kraken_report --output "$f"_kraken.out
done
