# dmx-HGSOC-Dec2020-samples

## Contents

Code to run demultiplexing pipeline on our set of HGSOC samples from December 2020. The demultiplexing pipeline uses bcftools, cellSNP, and Vireo.


## Samples

This dataset contains 7x bulk RNA-seq samples:

- 18431X1
- 18431X2
- 18431X3
- 18431X4
- 18431X5
- 18431X6
- 18431X7

And 2x single-cell RNA-seq samples:

- 18389X2
- 18389X3


## Pipeline

The single-cell samples each contain approximately 20,000 cells pooled across the 7 individuals. The bulk samples are used to generate the genotype reference (VCF file). Then, we run the demultiplexing pipeline on each of the single-cell samples to check if we recover the 7 individuals.

