# Differential gene expression analysis using DESeq2

library(DESeq2)
library(ggplot2)
library(pheatmap)

# Load gene count matrix
counts <- read.table("data/counts/gene_counts.txt",
                     header = TRUE,
                     row.names = 1,
                     comment.char = "#")

# Removing annotation columns
counts <- counts[, 6:ncol(counts)]

# Defining sample metadata
sample_info <- data.frame(
  row.names = colnames(counts),
  condition = c(rep("Control", 4), rep("T2D", 4))
)

# Creating DESeq2 dataset
dds <- DESeqDataSetFromMatrix(
  countData = counts,
  colData = sample_info,
  design = ~ condition
)

# Running differential expression analysis
dds <- DESeq(dds)
res <- results(dds)

# Creating output directories
dir.create("results/degs", showWarnings = FALSE)
dir.create("results/plots", showWarnings = FALSE)

# Save DESeq2 results
write.csv(as.data.frame(res),
          "results/degs/deseq2_results.csv")

# Variance stabilizing transformation and PCA plot
vsd <- vst(dds, blind = FALSE)

png("results/plots/pca.png")
plotPCA(vsd, intgroup = "condition")
dev.off()
