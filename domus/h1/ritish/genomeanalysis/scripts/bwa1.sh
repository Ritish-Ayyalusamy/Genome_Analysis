#!/bin/bash -l

#SBATCH -A uppmax2022-2-10
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 12:00:00
#SBATCH -J bwa1
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa
module load samtools

# Variables
REF="/home/ritish/genomeanalysis/canu/assembled_canu.contigs.fasta" 
TRIMREADS="/proj/genomeanalysis2022/Genome_Analysis/2_Christel_2017/RNA_trimmed_reads/"

cd /home/ritish/genomeanalysis/bwa

# Run BWA indexing
bwa index $REF -p lferrdb

# Run BWA MEM

for A in ERR2036629 ERR2036630 ERR2036631 ERR2036632 ERR2036633 \
ERR2117288 ERR2117289 ERR2117290 ERR2117291 ERR2117292
do
bwa mem -t 4 lferrdb \
$TRIMREADS${A}_P1.trim.fastq.gz $TRIMREADS${A}_P2.trim.fastq.gz |
samtools view -b | samtools sort -o ${A}.sorted.bam
done

