#!/bin/bash
#$ -V
#$ -cwd
#$ -l mem_free=5G,h_vmem=10G,h_fsize=100G

# qsub <scripts/filename.sh>

##############################
# Shell script to run demuxlet
##############################

# run demuxlet to demultiplex samples

# requires genotype reference from bcftools

# runtime:


mkdir -p outputs/demuxlet/18389X3_X5X7

demuxlet \
--sam outputs/cellranger/18389X3/outs/possorted_genome_bam.bam \
--group-list outputs/cellranger/18389X3/outs/filtered_feature_bc_matrix/barcodes.tsv.gz \
--alpha 0 --alpha 0.5 \
--vcf outputs/genotype/bcftools/bcftools_HGSOC_Dec2020_X5X7.vcf \
--field GT \
--out outputs/demuxlet/18389X3_X5X7

