For the current implementation of the FAME metagenomic workflow go to: https://github.com/linsalrob/atavide_lite/blob/main/slurm/README.md 

Outputs files from the above implementation:
  1) fastq/: Demultiplexed raw fastq files from the sequencing facility
  2) fastq_fastp/: These are the tag cleaned files
  3) fasta/ fasta: Files converted from Fastq_fastp/ fastq files for mmseqs
  4) mmseq/: Results of mmseqs using the UniRef50 database. These are the raw outputs from mmseqs for each individual      sample. These files include both the taxonomimc and gene function annotations. If you wish to link the taxonomic      and gene function annotations (ie read # X corresondes with taxa A and gene function R), the linking information      is in <sample_name>_tophit_report_subsystems.gz.
  5) Taxonomy/: parsed results from mmseqs output converting the Kraken2 output into a table format of taxonomic 
     hierarchical categorisation by samples. Number indicate counts of reads assigned to each taxa.
  6) subsystems/: parsed results from mmseqs converting the subsystem assignments into a table format with subsystem 
     hierarchies by samples. Numbers indicate counds of reads assigned to each subsystem
       - three sets of outputs are included:
            A) <subsystem_level>_norm_all.tsv: values are normalized by total number of reads in library
            B) <subsystem_level>_norm_ss.tsv: values are normalized by the total number of reads with a hit to a                     subystem
            C) <subsystem_level>_raw.tsv: values are raw counts
       - It is unclear which way is correct -- try to analyse and see if the results change.
8) megahit/: These are the constructed contigs from the samples
9) vamb/: The results of binning the contigs can be found in this directory.

# FAMEous-metagenomic-workflow
This is a step-by-step workflow used to analyze metagenomes. 
For paired end reads only 

The commands are saved as SLURM scripts to run on a local cluster - alter the SLURM parameters for your own HPC

## Input data

Place the reads in the fastq directory, copy them over to this directory. 

Currently this directory has two test metagenomes

## Pre-requisite software 
Download Miniconda2 - https://docs.conda.io/en/latest/miniconda.html

## Quality control 
- If you wish to just run quality control to remove the low quality reads, go to **Prinseq** directory for more instructions 
- For human DNA or other host removal steps followed by prinseq - go to **Trimnami** directory for more instructions

## Single read annotation
- Go to **MMseqs2** directory for taxonomic and functional based annotation
- Go to **kraken** directory for taxa based annotations 
- Go to **superfocus** directory for function based annotations

## Assembly 
- Go to **megahit** directory for assembly 
- Go to **spades** directory for assembly

## Binning 
- Go to **metacoag** directory
- Go to **vamb** directory

