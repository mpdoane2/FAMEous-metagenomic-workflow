# Megahit 

For more details - https://github.com/voutcn/megahit

## Settting up the environment 

        #Create a new conda environment
        conda create -n megahit 

        #Activate the new environment created
        conda activate megahit

        #Install python-pip package
        mamba install -c bioconda megahit
        mamba install -c bioconda bandage

## Generating input files here
    There are several options here 
    1. cross assemble all the reads from a project together. To do this, 

            cat trimnami.out/prinseq/*.paired.R1.fastq.gz >> left.fastq.gz
            cat trimnami.out/prinseq/*.paired.R2.fastq.gz >> right.fastq.gz

    2. Cross assemble a specific set of reads in a project together. To do this, 

            cat trimnami.out/prinseq/<group>.paired.R1.fastq.gz >> group_R1.fastq.gz
            cat trimnami.out/prinseq/<group>.paired.R2.fastq.gz >> group_R2.fastq.gz

        Repeat this again and again for all the groups


    3. Individual sample assemblies 
        Dont do anything here. 


## Submit the megahit command 

    Before you submit the script above, make sure uncomment (remove #) before the right command option
    There are three commands written for the three instances mentioned above

        #To test the command, run 
        sbatch megahit.sh

## Output 
A new directory starting with "megahit*" with the megahit assembly 
