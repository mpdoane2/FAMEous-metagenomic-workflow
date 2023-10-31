# Metacoag

For more details - https://github.com/metagentools/MetaCoAG
The advantage of using this script is that this binning tool uses both the assembly file as well as the graph to assemble.

## Settting up the environment 

        #Create a new conda environment
        conda create -n metacoag 

        #Activate the new environment created
        conda activate metacoag

        #Install python-pip package
        mamba install biopython
        mamba install -c conda-forge python-igraph
        mamba install -c conda-forge tqdm
        mamba install -c bioconda metacoag
        
        

## Input files for running this script
    In the assembly file, 
    - assembled contigs file 
    - contigs graph 
    - contigs graph.path file 
  
  Need to generate an abundance.tsv file with reads mapped to the assembly. - this has been added to the metacoag.sh script. So this file should be generated and run.

  Due to conflicts, I am building a new environment for coverm 
  
      conda create -n coverm
      conda activate coverm
      mamba install -c coverm

  Next running the below commands to build the "abundance.tsv"

      sbatch coverm.sh

  This should generate files that end with "*_abundance.tsv".

## Submit the spades command 

    Before you submit the script above, make sure uncomment (remove #) before the right command option
    There are three commands written for the three instances mentioned above

        #To test the command, run 
        sbatch metacoag.sh

## Output 
The output of MetaCoAG will contain the following main files and folders.

- contig_to_bin.tsv containing the comma separated records of contig id, bin number
- bins containing the identified bins (FASTA file for each bin)
- low_quality_bins containing the identified low-quality bins, i.e., having a fraction of marker genes lower than bin_mg_threshold (FASTA file for each bin)
- *.frag.faa, *.frag.ffn and *.frag.gff files containing FragGeneScan output
- *.hmmout containing HMMER output
