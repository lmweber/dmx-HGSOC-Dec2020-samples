#!/bin/bash
#$ -V
#$ -cwd
#$ -l mem_free=2G,h_vmem=3G,h_fsize=100G

# qsub <scripts/filename.sh>

######################################################################
# Shell script to genotype bulk RNA-seq samples using bcftools mpileup
######################################################################

# This script runs bcftools mpileup to generate a genotype reference VCF file 
# from the aligned bulk RNA-seq samples. Note that we only use the bulk samples 
# from the individuals included in the single-cell pool (X4-X7).

# note: requires BAM files from previous scripts "align_index_bulk.sh"

# runtime: ~1 day


# --------------------
# Run bcftools mpileup
# --------------------

mkdir -p outputs/genotype/bcftools

bcftools mpileup -Ou \
-f ../../cellranger/refdata-gex-GRCh38-2020-A/fasta/genome.fa \
outputs/genotype/18431X4/STAR/Aligned.sortedByCoord.out.bam \
outputs/genotype/18431X5/STAR/Aligned.sortedByCoord.out.bam | \
bcftools call -mv -Ov \
-o outputs/genotype/bcftools/bcftools_HGSOC_Dec2020_X4X5.vcf

