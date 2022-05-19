#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 06:00:00
#SBATCH -J canuassembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se

# Load modules
module load bioinfo-tools
module load canu

# running canu
canu \
-d /home/ritish/GA/analysis/ \
-p canu1 \
genomesize=3m \
corThreads=4 \
useGrid=false \
-pacbio-raw /proj/genomeanalysis2022/Genome_Analysis/2_Christel_2017/DNA_raw_data/*
