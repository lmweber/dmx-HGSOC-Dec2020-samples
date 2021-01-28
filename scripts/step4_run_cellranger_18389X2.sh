#!/bin/bash
#$ -V
#$ -cwd
#$ -pe local 10
#$ -l mem_free=6G,h_vmem=12G,h_fsize=300G

# qsub <scripts/filename.sh>

#################################
# Shell script to run Cell Ranger
#################################

# for more details:
# - https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/using/tutorial_ct

# notes:
# - maximum file size and memory usage in cluster job submission need to be large enough, otherwise Cell Ranger fails
# - option '--nosecondary' disables secondary analysis (e.g. dimension reduction) for faster runtime

# runtime: ~2 days


# set working directory for output path (Cell Ranger does not have any other 
# option to specify output directory)
cwd=$(pwd)
mkdir -p outputs/cellranger
cd outputs/cellranger


# notes:
# - hard-coding parameters for number of cores, memory, and virtual memory; 
# since other values tend to give unexpected errors on our cluster
cellranger count --id=18389X2 \
--description=18389X2 \
--transcriptome=../../../../cellranger/refdata-gex-GRCh38-2020-A \
--fastqs=../../../../data/HGSOC/gnomex/18389R/Fastq/18389X2 \
--sample=18389X2_201208_A00421_0264_AHM2VMDSXY \
--nosecondary \
--jobmode=local \
--localcores=10 \
--localmem=50 \
--localvmem=100


# restore working directory
cd $cwd

