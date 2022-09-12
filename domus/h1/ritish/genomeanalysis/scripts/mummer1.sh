#!/bin/bash -l

#SBATCH -A uppmax2022-2-10
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J mummer
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se 

module load bioinfo-tools
module load MUMmer/3.23
module load samtools

nucmer -maxmatch -nosimplify /proj/genomeanalysis2022/Genome_Analysis/2_Christel_2017/reference/OBMB01.fasta /home/ritish/genomeanalysis/canu/assembled_canu.contigs.fasta 
 

show-coords -lrcTH out.delta > overlapping_coords.out


# running MUMmer
mummer -mum -b -c /proj/genomeanalysis2022/Genome_Analysis/2_Christel_2017/reference/OBMB01.fasta /home/ritish/genomeanalysis/canu/assembled_canu.contigs.fasta > lf.mums   


mummerplot --postscript --prefix=lferriphilum lf.mums

gnuplot lferriphilum.gp
