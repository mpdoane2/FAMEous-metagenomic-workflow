#!/bin/bash
#SBATCH --job-name=vamb
#SBATCH --output=%x-%j.out.txt
#SBATCH --error=%x-%j.err.txt
#SBATCH --time=2-0
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=900G
#SBATCH --partition=high-capacity
#SBATCH --qos=hc-concurrent-jobs

#this is cpu version
vamb --outdir vamb-individual --fasta Allcontigs.fasta --bamfiles bam-store/*.bam -o C --minfasta 200000
