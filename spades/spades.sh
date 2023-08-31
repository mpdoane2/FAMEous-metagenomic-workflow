#!/bin/bash
#SBATCH --job-name=spades
#SBATCH --output=%x-%j.out.txt
#SBATCH --error=%x-%j.err.txt
#SBATCH --time=1-0
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=500G
#SBATCH --partition=high-capacity
#SBATCH --qos=hc-concurrent-jobs

##cross assembly run 
#spades.py -1 left_R1.fastq.gz -2 right_R2.fastq.gz -o spades_crossAssembly 

##spades assembly for groups, copy paste the below command for each group - make sure to change the input and output file names
##Group1 
spades.py -1 biofilm_R1.fastq.gz -2 biofilm_R2.fastq.gz -o spades_crossAssembly_biofilm  

##Group2
spades.py -1 water_R1.fastq.gz -2 water_R2.fastq.gz -o spades_crossAssembly_water  

#spades assembly for each sample individually
#cut -f 1 ./trimnami/trimnami.out/samples.tsv > tmp
#for f in `cat tmp`; do megahit -1 /trimnami/trimnami.out/results/prinseq/"$f"_R1.host_rm.fastq.gz -2 /trimnami/trimnami.out/results/prinseq/"$f"_R2.host_rm.fastq.gz -o spades_"$f"_assembly; done
