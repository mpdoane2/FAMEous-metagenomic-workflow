#!/bin/bash
#SBATCH --job-name=megahit
#SBATCH --output=%x-%j.out.txt
#SBATCH --error=%x-%j.err.txt
#SBATCH --time=1-0
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=500G
#SBATCH --partition=high-capacity
#SBATCH --qos=hc-concurrent-jobs

##cross assembly run 
#megahit -1 left_R1.fastq.gz -2 right_R2.fastq.gz -o megahit_crossAssembly 
#kmer=$(head -1 megahit_crossAssembly | sed 's/>//' | sed 's/_.*//')
#megahit_toolkit contig2fastg $kmer megahit_crossAssembly/final.contigs.fa > megahit_crossAssembly/final.contigs.fastg
#Bandage reduce megahit_crossAssembly/final.contigs.fastg megahit_crossAssembly/final.contigs.gfa 


##megahit assembly for groups, copy paste the below command for each group - make sure to change the input and output file names
##Group1 

megahit -1 biofilm_R1.fastq.gz -2 biofilm_R2.fastq.gz -o megahit_crossAssembly_biofilm  
kmer=$(head -1 megahit_crossAssembly_biofilm/final.contigs.fa | sed 's/>//' | sed 's/_.*//')
megahit_toolkit contig2fastg $kmer megahit_crossAssembly_biofilm/final.contigs.fa > megahit_crossAssembly_biofilm/final.contigs.fastg
Bandage reduce megahit_crossAssembly_biofilm/final.contigs.fastg megahit_crossAssembly_biofilm/final.contigs.gfa 

##Group2
megahit -1 water_R1.fastq.gz -2 water_R2.fastq.gz -o megahit_crossAssembly_water  
kmer=$(head -1 megahit_crossAssembly_water | sed 's/>//' | sed 's/_.*//')
megahit_toolkit contig2fastg $kmer megahit_crossAssembly_water/final.contigs.fa > megahit_crossAssembly_water/final.contigs.fastg
Bandage reduce megahit_crossAssembly_water/final.contigs.fastg megahit_crossAssembly_water/final.contigs.gfa 


#megahit assembly for each sample individually
#cut -f 1 ./trimnami/trimnami.out/samples.tsv > tmp
#for f in `cat tmp`; do megahit -1 /trimnami/trimnami.out/results/prinseq/"$f"_R1.host_rm.fastq.gz -2 /trimnami/trimnami.out/results/prinseq/"$f"_R2.host_rm.fastq.gz -o megahit_"$f"_assembly; done
