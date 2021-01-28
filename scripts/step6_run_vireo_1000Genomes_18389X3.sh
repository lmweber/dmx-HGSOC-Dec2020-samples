#!/bin/bash
#$ -V
#$ -cwd
#$ -l mem_free=5G,h_vmem=10G,h_fsize=100G

# qsub <scripts/filename.sh>

###########################
# Shell script to run Vireo
###########################

# run Vireo to demultiplex samples

# notes:
# - assuming known number of samples
# - requires cellSNP output from previous step

# for more details:
# - https://vireosnp.readthedocs.io/en/latest/manual.html

# runtime: ~10 min


mkdir -p outputs/vireo_1000Genomes/18389X3

vireo -c outputs/cellSNP_1000Genomes/18389X3 -N 4 -o outputs/vireo_1000Genomes/18389X3 --randSeed=123

