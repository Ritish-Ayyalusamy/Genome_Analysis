#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:30:00
#SBATCH -J mumm_plot
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se

# Load modules
module load bioinfo-tools
module load MUMmer/3.23
module load samtools

# file path
INPUT="/home/ritish/GA/analysis/canu1.contigs.fasta"
OUTPUT="/home/ritish/GA/mummer/"
REF="/home/ritish/GA/quast/OBMB01.fasta"

#run mummer
mummer -mum -b -c \
$REF \
$INPUT \
> $OUTPUT/lefe.mum

#plot
cd $OUTPUT

mummerplot \
-Q $INPUT \
-R $REF \
$OUTPUT/lefe.mum \
--png --prefix=lefe

gnuplot lefe.gp

