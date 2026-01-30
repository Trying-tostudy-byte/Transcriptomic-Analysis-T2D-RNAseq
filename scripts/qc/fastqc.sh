
# Performing quality control on raw RNA-seq FASTQ files using FastQC

# Creating output directory 
mkdir -p results/qc_reports/fastqc

# Running FastQC on all raw FASTQ files
fastqc data/raw/*.fastq.gz \
  -o results/qc_reports/fastqc
