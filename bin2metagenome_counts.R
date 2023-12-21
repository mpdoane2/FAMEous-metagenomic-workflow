#The below R commands will merge outputs to from several processes into a single output for comparing the number of reads from metagenomes that contribute to identified bins. 
#R Version 4.2.1

library(readxl)
library(dplyr)
library(tidyr)

#CoverM output (generate read count for contigs)
mag_counts <- read.table ("sawshark_mag_counts.tsv", sep = "\t", header = T)

#GTDBtk classify output
bin_taxa <- read.table ("../MAGs/sawshark_gtdbtk.bac120.summary.tsv", sep = "\t", header = T)

#CheckM2 output
bin_quality <- read.table ("../MAGs/sawshark_quality_report.tsv", sep = "\t", header = T)

mags <- mag_counts %>%
  pivot_longer (-V2, names_to = "sample", values_to = "value") %>%
  left_join (vae_cluster, by = "V2") %>% 
  rename ("MAG" = V1, "contig" = V2) %>%
  select(-contig) %>%
  group_by (sample, MAG) %>%
  mutate (sample_value = sum(value)) %>%
  select (-value) %>%
  distinct () %>%
  pivot_wider (names_from = sample, values_from = sample_value, values_fill = 0) %>%
  rename("bin" = MAG)



bins <- bin_quality %>%
  left_join ((bin_taxa %>% select (bin,taxonomy)), by = "bin") %>%
  left_join (mags, by = "bin")

write.csv (bins, "../MAGs/sawshark_bins.csv")
