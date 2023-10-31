#!/bin/bash
#SBATCH --job-name=metacoag-group1
#SBATCH --output=%x-%j.out.txt
#SBATCH --error=%x-%j.err.txt
#SBATCH --time=7-0
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=990G
#SBATCH --partition=high-capacity
#SBATCH --qos=hc-concurrent-jobs

## metacoag run for spades assembly and for groups
#group1
#mkdir metacoag_biofilm
#metacoag --assembler spades --graph ../spades/spades_crossAssembly_biofilm/assembly_graph_after_simplification.gfa --contigs ../spades/spades_crossAssembly_biofilm/contigs.fasta --paths ../spades/spades_crossAssembly_biofilm/contigs.paths --abundance biofilm_abundance.tsv --output metacoag_biofilm --nthreads 16
#group2
mkdir metacoag_water
metacoag --assembler spades --graph ../spades/spades_crossAssembly_water/assembly_graph_after_simplification.gfa --contigs ../spades/spades_crossAssembly_water/contigs.fasta --paths ../spades/spades_crossAssembly_water/contigs.paths --abundance water_abundance.tsv --output metacoag_water --nthreads 64


