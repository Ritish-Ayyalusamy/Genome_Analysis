#!/bin/bash -l

#SBATCH -A uppmax2022-2-10
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 02:00:00
#SBATCH -J blastsynteny
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se

# Load modules
module load bioinfo-tools
module load blast

# variables
cd /home/ritish/genomeanalysis/blast/

blastn -query /home/ritish/genomeanalysis/canu/assembled_canu.contigs.fasta \
 -subject /home/ritish/genomeanalysis/blast/Leptospirillumferriphilum.fasta -out blastn.rs  -outfmt 6


