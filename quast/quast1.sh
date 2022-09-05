#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:15:00
#SBATCH -J Quast
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se

module load bioinfo-tools
module load quast
quast.py /home/ritish/genomeanalysis/canu/assembled_canu.contigs.fasta -R /proj/genomeanalysis2022/Genome_Analysis/2_Christel_2017/reference/OBMB01.fasta -t 4
