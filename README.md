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

- If you wish to just run quality control to remove the low quality reads, the goto **Prinseq** directory for more instructions 
- For human DNA or other host removal steps followed by prinseq - goto to **Trimnami** directory for more instructions

## Read based taxonomic annotation 

- Go to **kraken** directory for taxa based annotations 
- Go to **superfocus** directory for function based annotations 

## Assembly 

- Go to **megahit** directory for assembly 
- Go to **spades** directory for assembly
  

