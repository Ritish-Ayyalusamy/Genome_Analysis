#!/bin/bash -l

#SBATCH -A uppmax2022-2-10
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 12:00:00
#SBATCH -J canuassembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se

# Load modules
module load bioinfo-tools
module load canu

# running canu
canu \
-p assembled_canu \
-d /home/ritish/genomeanalysis/canu \
genomesize=2.62m \
maxThreads=4 \
useGrid=false \
-pacbio-raw /proj/genomeanalysis2022/Genome_Analysis/2_Christel_2017/DNA_raw_data/*

