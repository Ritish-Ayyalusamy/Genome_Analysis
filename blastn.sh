#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J blastn
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se
#SBATCH --reservation=uppmax2022-2-5_11

# Load modules
module load bioinfo-tools
module load blast

# variables 
INPUT="/home/ritish/GA/analysis/canu1.contigs.fasta"
OUTPUT="/home/ritish/GA/blastn/blast.txt"

# Run blast
blastn -db nt \
-query $INPUT \
-out $OUTPUT 
