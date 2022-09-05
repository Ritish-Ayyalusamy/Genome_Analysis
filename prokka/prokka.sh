#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J Prokka_May14th
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se

module load bioinfo-tools
module load prokka

# variables
OUTPUT="/home/ritish/genomeanalysis/prokka"


# running prokka
prokka \
--outdir $OUTPUT --force --prefix lferr --locustag LFT \
--genus Leptospirillum --species ferriphilum --strain DSM_14647 --gram neg\
--usegenus --cpus 4 --rfam \
/home/ritish/genomeanalysis/canu/assembled_canu.contigs.fasta \
