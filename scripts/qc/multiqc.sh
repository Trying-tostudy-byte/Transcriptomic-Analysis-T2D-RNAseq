
# Aggregating FastQC reports into a single summary using MultiQC

# Creatin output directory
mkdir -p results/qc_reports/multiqc

# Generating MultiQC report
multiqc results/qc_reports/fastqc \
  -o results/qc_reports/multiqc
