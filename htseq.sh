#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 16:00:00
#SBATCH -J htseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se

# Load modules
module load bioinfo-tools
module load htseq

# Variables
BAM=/home/ritish/GA/BWA/

cd /home/ritish/GA/htseq

for F in ERR2036629 ERR2036630 ERR2036631 ERR2036632 ERR2036633
do
htseq-count -f bam -r pos -s reverse -t CDS -i ID \
$BAM${F}.sorted.bam /home/ritish/GA/htseq/leptonofasta.gff > ${F}.txt
done
