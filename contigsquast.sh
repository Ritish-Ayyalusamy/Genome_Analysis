#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:30:00
#SBATCH -J quast_eval
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se

# Load modules
module load bioinfo-tools
module load quast

# file path
INPUT="/home/ritish/GA/analysis/canu1.contigs.fasta"
OUTPUT="/home/ritish/GA/quast/"
REF="/home/ritish/GA/quast/OBMB01.fasta"

#run quast
quast.py \
/home/ritish/GA/analysis/canu1.contigs.fasta \
-R /home/ritish/GA/quast/OBMB01.fasta \
-o /home/ritish/GA/quast/ \


