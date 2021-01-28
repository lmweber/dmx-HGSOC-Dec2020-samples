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


mkdir -p outputs/vireo/18389X2

vireo -c outputs/cellSNP/18389X2 -N 4 -o outputs/vireo/18389X2 --randSeed=123

