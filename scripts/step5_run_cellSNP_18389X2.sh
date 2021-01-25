#!/bin/bash
#$ -V
#$ -cwd
#$ -pe local 10
#$ -l mem_free=5G,h_vmem=10G,h_fsize=100G

# qsub <scripts/filename.sh>

#############################
# Shell script to run cellSNP
#############################

# run cellSNP to genotype cells

# notes:
# - running cellSNP in mode 1
# - using .vcf file from best-performing option for genotyping step (matched bulk 
# RNA-seq samples using bcftools)
# - requires BAM file, cell barcodes file, and .vcf file

# for more details:
# - https://vireosnp.readthedocs.io/en/latest/genotype.html
# - https://github.com/single-cell-genetics/cellSNP


cellSNP \
-s outputs/cellranger/18389X2/outs/possorted_genome_bam.bam \
-b outputs/cellranger/18389X2/outs/filtered_feature_bc_matrix/barcodes.tsv.gz \
-O outputs/cellSNP/18389X2 \
-R outputs/genotype/bcftools/bcftools_HGSOC_Dec2020_samples.vcf \
-p 10 \
--minMAF=0.1 \
--minCOUNT=20

