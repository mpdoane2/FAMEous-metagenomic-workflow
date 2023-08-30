#!/bin/bash
#SBATCH --job-name=trimnami
#SBATCH --output=%x-%j.out.txt
#SBATCH --error=%x-%j.err.txt
#SBATCH --time=1-0
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=100G
#SBATCH --partition=high-capacity
#SBATCH --qos=hc-concurrent-jobs

trimnami run --reads ../fastq fastp prinseq --host  GCA_000001405.15_GRCh38_no_alt_analysis_set.fna
