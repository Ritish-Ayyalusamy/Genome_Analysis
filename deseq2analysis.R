# DIFFERENTIAL EXPRESSION ANALYSIS
# Analysis of differential expressiond and of PCA plot, Volcano plot.

# Load libraries
library(data.table)
library(DESeq2)
library(ggplot2)
library(EnhancedVolcano)
library(reshape2)
library(dplyr)

# File paths for easier access

path1 = "C:/Users/napbo/Desktop/genomea/genomeanalysis/htseq/"
pathdata="C:/Users/napbo/Desktop/genomea/genomeanalysis/rna/rna.txt"

#DESEQ2
# First put all file names into a list 
file_list <- list.files(path = path1,pattern = ".txt")

# first file and row names as gene names
dataset = read.delim(file = paste(path1,file_list[1],sep=""), sep = '\t', header = FALSE, row.names = 1)

#other files
for (i in 2:length(file_list)){
  temp_data <- fread(paste(path1,file_list[i],sep=""), stringsAsFactors = F, select = c(2)) 
  dataset <- cbind(dataset, temp_data) 
}

#column names
colnames = gsub(".txt","",file_list)
setnames(dataset, colnames)
# Filter
filtered_dataset <- subset(dataset, grepl("LFT", row.names(dataset)))

#metadata
metadata = read.delim(file = pathdata, sep=",", header = T, row.names = 1)
metadata <- metadata[1:5,]

#DESeq data 
dds <- DESeqDataSetFromMatrix(
  countData = filtered_dataset,
  colData = metadata,
  design = ~ Type 
)

#DESeq analysis
dds <- DESeq(dds)
resAll <- results(dds)
res <- results(dds, contrast = c("Type","Chemostat","Mineral"))
resOrder <- res[order(res$pvalue),]

plotMA(res)
# MA plot
## RESULTS PLOTS
ddsvst <- vst(dds)

#PCA plot
pos_vec <- c(2, 2, -2, -2, 2)
pca <- plotPCA(ddsvst, intgroup="Type") +
  geom_text(aes(label=colnames), nudge_x = pos_vec) +
  labs(color = "Culture type")

pca

write.csv( as.data.frame(res))
# Volcano plot
EnhancedVolcano(res,
                lab = rownames(res),
                x = 'log2FoldChange',
                y = 'padj',
                pCutoff = 0.01)

# Heatmap

resdf <- as.data.frame(res)
