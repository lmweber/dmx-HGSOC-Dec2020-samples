#!/bin/bash
#$ -V
#$ -cwd
#$ -l mem_free=2G,h_vmem=3G,h_fsize=100G

# qsub <scripts/filename.sh>

######################################################################
# Shell script to genotype bulk RNA-seq samples using bcftools mpileup
######################################################################

# This script runs bcftools mpileup to genotype and generate VCF files for the 
# bulk RNA-seq samples in our HGSOC dataset.

# note: requires BAM files from previous scripts "align_index_bulk.sh"


# --------------------
# Run bcftools mpileup
# --------------------

mkdir -p genotype/bcftools

bcftools mpileup -Ou \
-f ../../cellranger/refdata-gex-GRCh38-2020-A/fasta/genome.fa \
genotype/18431X1/STAR/Aligned.sortedByCoord.out.bam \
genotype/18431X2/STAR/Aligned.sortedByCoord.out.bam \
genotype/18431X3/STAR/Aligned.sortedByCoord.out.bam \
genotype/18431X4/STAR/Aligned.sortedByCoord.out.bam \
genotype/18431X5/STAR/Aligned.sortedByCoord.out.bam \
genotype/18431X6/STAR/Aligned.sortedByCoord.out.bam \
genotype/18431X7/STAR/Aligned.sortedByCoord.out.bam \
bcftools call -mv -Ov \
-o genotype/bcftools/bcftools_HGSOC_Dec2020_samples.vcf

