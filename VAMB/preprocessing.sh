#!/bin/bash
#SBATCH --job-name=vamb_preprocess
#SBATCH --output=%x-%j.out.txt
#SBATCH --error=%x-%j.err.txt
#SBATCH --time=4-0
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=30
#SBATCH --mem=900G
#SBATCH --partition=high-capacity
#SBATCH --qos=hc-concurrent-jobs

#Concatenate all the individual or grouped assemblies together
# removed all the contigs below 2000b
#concatenate.py Allcontigs.fa ../spades/spades_crossAssembly_biofilm/contigs.fasta ../spades/spades_crossAssembly_water/contigs.fasta 
#concatenate.py Allcontigs.fasta ../spades/*_assembly/contigs.fasta 

#first generate a tsv file with the sample names 
#ls ../trimnami/trimnami.out/results/prinseq | grep "_R1.host_rm.fastq.gz" | sed 's/_R1.host_rm.fastq.gz//g' > samples.tsv

#instead of typing this out n number of times for each sample you can use a for loop 
minimap2 -d allcontigs.mmi Allcontigs.fasta
mkdir bam-store
for f in `cat samples.tsv`; do  minimap2 -t 8 -N 5 -ax sr allcontigs.mmi --split-prefix mmsplit ../trimnami/trimnami.out/results/prinseq/"$f"_R1.host_rm.fastq.gz ../trimnami/trimnami.out/results/prinseq/"$f"_R2.host_rm.fastq.gz | samtools view -F 3584 -b --threads 30 > bam-store/"$f".bam ; done
