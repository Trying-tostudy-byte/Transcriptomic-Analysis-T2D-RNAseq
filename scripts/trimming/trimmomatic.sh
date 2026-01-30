
# Trim mingn low-quality bases and adapters from paired-end reads using Trimmomatic

# Creating directory for trimmed reads
mkdir -p data/trimmed

# Loop through all forward reads
for sample in data/raw/*_R1.fastq.gz
do
  # Extracting sample base name
  base=$(basename ${sample} _R1.fastq.gz)

  # Running Trimmomatic in paired-end mode
  trimmomatic PE \
    data/raw/${base}_R1.fastq.gz \
    data/raw/${base}_R2.fastq.gz \
    data/trimmed/${base}_R1.trim.fastq.gz \
    data/trimmed/${base}_R1.unpaired.fastq.gz \
    data/trimmed/${base}_R2.trim.fastq.gz \
    data/trimmed/${base}_R2.unpaired.fastq.gz \
    SLIDINGWINDOW:4:20 MINLEN:36
done
