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
# - using .vcf file from 1000 Genomes Project provided by cellSNP authors
# - requires BAM file, cell barcodes file, and .vcf file

# for more details:
# - https://vireosnp.readthedocs.io/en/latest/genotype.html
# - https://github.com/single-cell-genetics/cellSNP

# runtime: ~4 days


mkdir -p outputs/cellSNP_1000Genomes/18389X3

cellSNP \
-s outputs/cellranger/18389X3/outs/possorted_genome_bam.bam \
-b outputs/cellranger/18389X3/outs/filtered_feature_bc_matrix/barcodes.tsv.gz \
-O outputs/cellSNP_1000Genomes/18389X3 \
-R ../../cellSNP/genome1K.phase3.SNP_AF5e2.chr1toX.hg38.vcf \
-p 10 \
--minMAF=0.1 \
--minCOUNT=20

