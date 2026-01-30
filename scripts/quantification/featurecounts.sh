
# Quantifying gene-level read counts using featureCounts

# Creating directory for count files
mkdir -p data/counts

# Running featureCounts on all BAM files
featureCounts -T 4 -p \
  -a ref/annotation.gtf \
  -o data/counts/gene_counts.txt \
  results/bam/*.bam
