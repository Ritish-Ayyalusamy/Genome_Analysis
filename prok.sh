#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:10:00
#SBATCH -J prokanotation
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se
#SBATCH --reservation=uppmax2022-2-5_10
#load modules
module load bioinfo-tools
module load prokka

#load path
OUTPUT="/home/ritish/GA/prokka"                                                                

# running prokka
prokka \
--outdir $OUTPUT --force --prefix leptoferri --addgenes --locustag LFT \
--genus Leptospirillum --species ferriphilum --strain DSM_14647 --gram neg\
--usegenus --cpus 4 --rfam \
/home/ritish/GA/analysis/canu1.contigs.fasta
