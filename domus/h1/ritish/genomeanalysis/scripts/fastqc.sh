#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J RNA_1
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se

# Load modules
module load bioinfo-tools
module load FastQC

#variable
INPUT="/proj/genomeanalysis2022/Genome_Analysis/2_Christel_2017/RNA_raw_data/*.fastq.gz"
OUTPUT="/home/ritish/genomeanalysis/fastqc"

# running FastQC
fastqc -t 4\
 -o /home/ritish/genomeanalysis/fastqc \
 -d /home/ritish/genomeanalysis/fastqc \
/proj/genomeanalysis2022/Genome_Analysis/2_Christel_2017/RNA_raw_data/*.fastq.gz

