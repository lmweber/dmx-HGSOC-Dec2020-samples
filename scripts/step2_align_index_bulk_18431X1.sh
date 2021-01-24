#!/bin/bash
#$ -V
#$ -cwd
#$ -pe local 10
#$ -l mem_free=10G,h_vmem=11G,h_fsize=100G

# qsub <scripts/filename.sh>

#########################################################
# Shell script to align reads for bulk samples using STAR
#########################################################

# This script runs (i) STAR to align reads and (ii) samtools to index the 
# resulting BAM file for the bulk RNA-seq samples in our HGSOC dataset.

# note: requires STAR index from previous script "create_STAR_index.sh"


# --------
# Run STAR
# --------

# align reads

STAR \
--genomeDir genotype/STAR_index \
--runThreadN 10 \
--readFilesIn ../../data/HGSOC/gnomex/18431R/Fastq/18431X1_201016_A00421_0249_BHKN3JDSXY_S60_L003_R1_001.fastq.gz ../../data/HGSOC/gnomex/18431R/Fastq/18431X1_201016_A00421_0249_BHKN3JDSXY_S60_L003_R2_001.fastq.gz \
--outFileNamePrefix genotype/18431X1/STAR/ \
--readFilesCommand gunzip -c \
--outSAMtype BAM SortedByCoordinate \
--limitGenomeGenerateRAM 200000000000


# ---------
# Index BAM
# ---------

samtools index genotype/18431X1/STAR/Aligned.sortedByCoord.out.bam

