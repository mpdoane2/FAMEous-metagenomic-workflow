# VAMB
**Variational Autoencoders Binning**

For more details - https://github.com/RasmussenLab/vamb \
Blogpost - https://bioengineeringcommunity.nature.com/posts/using-variational-autoencoders-for-metagenomic-binning

The advantage of using this script is that this binning tool uses deep learning to cluster the contigs to bins using contig coverage and kmer profiles as signatures to cluster. 

## Settting up the environment 

        #Create a new conda environment
        conda create -n vamb 

        #Activate the new environment created
        conda activate vamb

        #Install python-pip package
        mamba install -c pytorch pytorch torchvision cudatoolkit=10.2 python==3.7
        mamba install -c bioconda vamb
        mamba install -c bioconda minimap2
        mamba install -c samtools
        pip install CheckM2
        mamba install diamond
        mamba install prodigal
        

## Input files for running this script

To make this simple, I have added this to a script - preprocessing.sh

Simply run the below command 

        sbatch preprocessing.sh

But I am describing the commands added into the preprocessing.sh below

- Concatenate the input contigs of multiple groups together first, the more information provided - better the performance of the tool I believe 
  
        #Concatenate all the individual or grouped assemblies together
        # removed all the contigs below 2000bp
        concatenate.py Allcontigs.fa ../spades/spades_crossAssembly_biofilm/contigs.fasta ../spades/spades_crossAssembly_water/contigs.fasta 

-  Map each read file back to the Allcontigs.fa file

        #Make a index file of the Allcontigs.fa first 
        minimap2 -d allcontigs.mmi Allcontigs.fa

        #map reads from each sample back to the contigs, the output bam file is required by VAMB 
        #repeat this step for all your metagenomes 
        minimap2 -t 8 -N 5 -ax sr allcontigs.mmi --split-prefix mmsplit /path/to/reads/sample1.fw.fq.gz /path/to/reads/sample1.rv.fq.gz | samtools view -F 3584 -b --threads 8 > sample1.bam

        #instead of typing this out n number of times for each sample you can use a for loop 
        #first generate a tsv file with the sample names 
        ls ../../fastq | grep "_R1.fastq.gz" | sed 's/_R1.fastq.gz//g' > samples.tsv
        #replace ../../fastq with the directory with fastq reads

        for f in `cat `samples.tsv`; do  minimap2 -t 8 -N 5 -ax sr allcontigs.mmi --split-prefix mmsplit ../../fastq/"$f"__R1.fastq.gz ../../fastq/"$f"__R2.fastq.gz | samtools view -F 3584 -b --threads 8 > "$f".bam; done


## Submit the VAMB command 
## Need to update 
    Before you submit the script above, make sure uncomment (remove #) before the right command option
    There are three commands written for the three instances mentioned above

        #To test the command, 
        sbatch metacoag.sh

## Output 
The output of MetaCoAG will contain the following main files and folders.

- contig_to_bin.tsv containing the comma separated records of contig id, bin number
- bins containing the identified bins (FASTA file for each bin)
- low_quality_bins containing the identified low-quality bins, i.e., having a fraction of marker genes lower than bin_mg_threshold (FASTA file for each bin)
- *.frag.faa, *.frag.ffn and *.frag.gff files containing FragGeneScan output
- *.hmmout containing HMMER output

## Checkm2 processing 

**Install database**
        checkm2 database --download --path ~/db/checkm2
        export CHECKM2DB=/custom/path/

**Running**

        scatch checkm2.sh


**Output**
- qulaity_report.tsv
