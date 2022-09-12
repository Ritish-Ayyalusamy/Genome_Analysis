#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J trim1
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se


# Load modules
module load bioinfo-tools
module load trimmomatic

# Run trimmomatic in for only one set.

trimmomatic PE -phred33 \
/proj/genomeanalysis2022/Genome_Analysis/2_Christel_2017/RNA_raw_data/ERR2036629_1.fastq.gz 
/proj/genomeanalysis2022/Genome_Analysis/2_Christel_2017/RNA_raw_data/ERR2036629_2.fastq.gz 
/home/ritish/genomeanalysis/trimmomatic/ERR2036629_1_output_forward_paired.fq.gz \
/home/ritish/genomeanalysis/trimmomatic/ERR2036629_1_output_forward_unpaired.fq.gz \
/home/ritish/genomeanalysis/trimmomatic/ERR2036629_2_output_reverse_paired.fq.gz \
/home/ritish/genomeanalysis/trimmomatic/ERR2036629_2_output_reverse_unpaired.fq.gz \
ILLUMINACLIP:$SNIC_TMP/adapter/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 MINLEN:36


