
# Aligning trimmed RNA-seq reads to the reference genome using HISAT2

# Creating directory for BAM files
mkdir -p results/bam

# Loop through trimmed forward reads
for sample in data/trimmed/*_R1.trim.fastq.gz
do
  # Extracting sample base name
  base=$(basename ${sample} _R1.trim.fastq.gz)

  # Aligning reads and sort output BAM file
  hisat2 -p 4 -x ref/genome \
    -1 data/trimmed/${base}_R1.trim.fastq.gz \
    -2 data/trimmed/${base}_R2.trim.fastq.gz | \
    samtools sort -o results/bam/${base}.bam
done
