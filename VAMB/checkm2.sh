#!/bin/bash
#SBATCH --job-name=checkm2
#SBATCH --output=%x-%j.out.txt
#SBATCH --error=%x-%j.err.txt
#SBATCH --time=2-0
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=500G
#SBATCH --partition=high-capacity
#SBATCH --qos=hc-concurrent-jobs


checkm2 predict --threads 60 --input vamb-individual/bins --output-directory vamb-individual/checkm2 --force
