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
--genomeDir outputs/genotype/STAR_index \
--runThreadN 10 \
--readFilesIn ../../data/HGSOC/gnomex/18431R/Fastq/18431X6_201016_A00421_0249_BHKN3JDSXY_S65_L003_R1_001.fastq.gz ../../data/HGSOC/gnomex/18431R/Fastq/18431X6_201016_A00421_0249_BHKN3JDSXY_S65_L003_R2_001.fastq.gz \
--outFileNamePrefix outputs/genotype/18431X6/STAR/ \
--readFilesCommand gunzip -c \
--outSAMtype BAM SortedByCoordinate \
--limitGenomeGenerateRAM 200000000000


# ---------
# Index BAM
# ---------

samtools index outputs/genotype/18431X6/STAR/Aligned.sortedByCoord.out.bam

