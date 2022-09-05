#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J RNA_2
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se

# Load modules
module load bioinfo-tools
module load FastQC

#variable
INPUT="/proj/genomeanalysis2022/Genome_Analysis/2_Christel_2017/RNA_trimmed_reads/*.fastq.gz"
OUTPUT="/home/ritish/genomeanalysis/trimfastqc"

# running FastQC
fastqc -t 4\
 -o /home/ritish/genomeanalysis/trimfastqc \
 -d /home/ritish/genomeanalysis/trimfastqc \
/proj/genomeanalysis2022/Genome_Analysis/2_Christel_2017/RNA_trimmed_reads/*.fastq.gz




