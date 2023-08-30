# Trimnami 

For more details - https://github.com/beardymcjohnface/Trimnami

## Settting up the environment 

        #Create a new conda environment
        conda create -n trimnami 

        #Activate the new environment created
        conda activate trimnami

        #Install python-pip package
        mamba install -c anaconda pip

        #Install trimmani using pip 
        pip install trimnami

## Running the command 

        #To test the command, run 
        trimmani test

        #Generate the config file
        trimnami config


To run on actual data, update the script trimnami.sh - below are a few things to consider

### Trimnami script
**What to update**

- Host removal
  If you want to remove human sequences or or run the sequences against other host, first download this database 

  Below are the steps to download the human DNA sequences 

                #Download the sequences 
                wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/001/405/GCA_000001405.15_GRCh38/seqs_for_alignment_pipelines.ucsc_ids/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz

                #Extract the sequences 
                gunzip GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz

- Update the trimnami config file as needed
  
  This file is saved in `trimnami.out/trimnami.config.yaml`
  
  No changes then move on 

## Submit the trimnami command 

        #the below command will submit the job to HPC 
        sbatch trimnami.sh

        #check status of job 
        squeue -u "username"
        #replace username with your hpc username

## Trimnami output 

- Adaptor removal saved to `trimnami.out/fastp/`
- QC reads saved to `trimnami.out/prinseq/`
- host removal save to `trimnami.out/prinseq/`

For more inforamtion goto https://github.com/beardymcjohnface/Trimnami - section "Example outputs"





