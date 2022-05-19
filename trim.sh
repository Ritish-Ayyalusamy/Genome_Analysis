#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J trimming
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se

# Using Trimmomatic 
set -x

#change directory
cd /home/ritish/GA/trimmomatic

#copying
export SRCDIR=$HOME

# storage node
cd $SNIC_TMP
mkdir RNA
mkdir out
mkdir adapter

# changing directory
cp /proj/genomeanalysis2022/Genome_Analysis/2_Christel_2017/RNA_raw_data/* $SNIC_TMP/RNA
cp /home/ritish/GA/trimmomatic/TruSeq3-PE.fa $SNIC_TMP/adapter

# 
cat $SNIC_TMP/adapter/TruSeq3-PE.fa

# Load modules
module load bioinfo-tools
module load trimmomatic

# Going into output
cd $SNIC_TMP/out


trimmomatic PE -phred33 \
$SNIC_TMP/RNA/ERR2036629_1.fastq.gz \
$SNIC_TMP/RNA/ERR2036629_2.fastq.gz \
ERR2036629_1_output_forward_paired.fq.gz \
ERR2036629_1_output_forward_unpaired.fq.gz \
ERR2036629_2_output_reverse_paired.fq.gz \
ERR2036629_2_output_reverse_unpaired.fq.gz \
ILLUMINACLIP:$SNIC_TMP/adapter/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 MINLEN:36

trimmomatic PE -phred33 \
$SNIC_TMP/RNA/ERR2036630_1.fastq.gz \
$SNIC_TMP/RNA/ERR2036630_2.fastq.gz \
ERR2036630_1_output_forward_paired.fq.gz \
ERR2036630_1_output_forward_unpaired.fq.gz \
ERR2036630_2_output_reverse_paired.fq.gz \
ERR2036630_2_output_reverse_unpaired.fq.gz \
ILLUMINACLIP:$SNIC_TMP/adapter/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 MINLEN:36

trimmomatic PE -phred33 \
$SNIC_TMP/RNA/ERR2036631_1.fastq.gz \
$SNIC_TMP/RNA/ERR2036631_2.fastq.gz \
ERR2036631_1_output_forward_paired.fq.gz \
ERR2036631_1_output_forward_unpaired.fq.gz \
ERR2036631_2_output_reverse_paired.fq.gz \
ERR2036631_2_output_reverse_unpaired.fq.gz \
ILLUMINACLIP:$SNIC_TMP/adapter/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 MINLEN:36

trimmomatic PE -phred33 \
$SNIC_TMP/RNA_raw_data/ERR2036632_1.fastq.gz \
$SNIC_TMP/RNA_raw_data/ERR2036632_2.fastq.gz \
ERR2036632_1_output_forward_paired.fq.gz \
ERR2036632_1_output_forward_unpaired.fq.gz \
ERR2036632_2_output_reverse_paired.fq.gz \
ERR2036632_2_output_reverse_unpaired.fq.gz \
ILLUMINACLIP:$SNIC_TMP/adapter/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 MINLEN:36

trimmomatic PE -phred33 \
$SNIC_TMP/RNA/ERR2036633_1.fastq.gz \
$SNIC_TMP/RNA/ERR2036633_2.fastq.gz \
ERR2036633_1_output_forward_paired.fq.gz \
ERR2036633_1_output_forward_unpaired.fq.gz \
ERR2036633_2_output_reverse_paired.fq.gz \
ERR2036633_2_output_reverse_unpaired.fq.gz \
ILLUMINACLIP:$SNIC_TMP/adapter/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 MINLEN:36


cp -r $SNIC_TMP/out/* /home/ritish/GA/trimmomatic
