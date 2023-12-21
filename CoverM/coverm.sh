#!/bin/bash
#SBATCH --job-name=ss_coverm
#SBATCH --time=5-0
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=30
#SBATCH --mem=128G
#SBATCH --partition=high-capacity
#SBATCH --qos=hc-concurrent-jobs
#SBATCH -o /home/doan0033/coverm_results/sawsharks_coverm/coverm-%j.out
#SBATCH -e /home/doan0033/coverm_results/sawsharks_coverm/coverm-%j.err


coverm contig -m count -b /home/edwa0468/Projects/MikeD/sawsharks/vamb/mapped_reads/SAGCFN_22_01149_S3.bam /home/edwa0468/Projects/MikeD/sawsharks/vamb/mapped_reads/SAGCFN_22_01150_S4.bam /home/edwa0468/Projects/MikeD/sawsharks/vamb/mapped_reads/SAGCFN_22_01151_S5.bam /home/edwa0468/Projects/MikeD/sawsharks/vamb/mapped_reads/SAGCFN_22_01163_S11.bam /home/edwa0468/Projects/MikeD/sawsharks/vamb/mapped_reads/SAGCFN_22_01173_S19.bam /home/edwa0468/Projects/MikeD/sawsharks/vamb/mapped_reads/SAGCFN_22_01175_S20.bam /home/edwa0468/Projects/MikeD/sawsharks/vamb/mapped_reads/SAGCFN_22_01184_S27.bam /home/edwa0468/Projects/MikeD/sawsharks/vamb/mapped_reads/SAGCFN_22_01220_S43.bam /home/edwa0468/Projects/MikeD/sawsharks/vamb/mapped_reads/SAGCFN_22_01234_S49.bam /home/edwa0468/Projects/MikeD/sawsharks/vamb/mapped_reads/SAGCFN_23_00211_S1.bam /home/edwa0468/Projects/MikeD/sawsharks/vamb/mapped_reads/SAGCFN_23_00214_S1.bam /home/edwa0468/Projects/MikeD/sawsharks/vamb/mapped_reads/SAGCFN_23_00216_S1.bam /home/edwa0468/Projects/MikeD/sawsharks/vamb/mapped_reads/SAGCFN_23_00217_S1.bam /home/edwa0468/Projects/MikeD/sawsharks/vamb/mapped_reads/SAGCFN_23_00218_S1.bam /home/edwa0468/Projects/MikeD/sawsharks/vamb/mapped_reads/SAGCFN_23_00221_S1.bam /home/edwa0468/Projects/MikeD/sawsharks/vamb/mapped_reads/SAGCFN_23_00228_S1.bam /home/edwa0468/Projects/MikeD/sawsharks/vamb/mapped_reads/SAGCFN_23_00229_S1.bam -o /home/doan0033/coverm_results/sawsharks_coverm/sawshark_mag_counts.tsv
