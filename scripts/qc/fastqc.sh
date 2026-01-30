

mkdir -p results/qc_reports/fastqc

fastqc data/raw/*.fastq.gz \
  -o results/qc_reports/fastqc

