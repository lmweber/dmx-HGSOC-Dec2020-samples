#!/bin/bash
#$ -V
#$ -cwd
#$ -pe local 10
#$ -l mem_free=20G,h_vmem=21G,h_fsize=100G

# qsub <scripts/filename.sh>

###################################
# Shell script to create STAR index
###################################

# This script runs STAR to create genome index files, required by the following 
# scripts to run STAR to align reads for the bulk RNA-seq samples.

# note: creating STAR index requires up to 200GB of memory


# -----------------
# Create STAR index
# -----------------

# create genome index

STAR \
--runMode genomeGenerate \
--runThreadN 10 \
--genomeDir outputs/genotype/STAR_index \
--genomeFastaFiles ../../cellranger/refdata-gex-GRCh38-2020-A/fasta/genome.fa \
--sjdbGTFfile ../../cellranger/refdata-gex-GRCh38-2020-A/genes/genes.gtf \
--limitGenomeGenerateRAM 200000000000

