#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 16:00:00
#SBATCH -J bwafi
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se

cd /home/ritish/GA/bwa

# Load modules
module load bioinfo-tools
module load samtools
module load bwa

# Going into output
bwa index /home/ritish/GA/analysis/canu1.contigs.fasta
ls
bwa mem -t 2 /home/ritish/GA/analysis/canu1.contigs.fasta /home/ritish/GA/trimmomatic/ERR2036629_1_output_forward_paired.fq.gz /home/ritish/GA/trimmomatic/ERR2036629_2_output_reverse_paired.fq.gz > ERR2036629.sam
bwa mem -t 2 /home/ritish/GA/analysis/canu1.contigs.fasta /home/ritish/GA/trimmomatic/ERR2036630_1_output_forward_paired.fq.gz /home/ritish/GA/trimmomatic/ERR2036630_2_output_reverse_paired.fq.gz > ERR2036630.sam
bwa mem -t 2 /home/ritish/GA/analysis/canu1.contigs.fasta /home/ritish/GA/trimmomatic/ERR2036631_1_output_forward_paired.fq.gz /home/ritish/GA/trimmomatic/ERR2036631_2_output_reverse_paired.fq.gz > ERR2036631.sam
bwa mem -t 2 /home/ritish/GA/analysis/canu1.contigs.fasta /home/ritish/GA/trimmomatic/ERR2036632_1_output_forward_paired.fq.gz /home/ritish/GA/trimmomatic/ERR2036632_2_output_reverse_paired.fq.gz > ERR2036632.sam
bwa mem -t 2 /home/ritish/GA/analysis/canu1.contigs.fasta /home/ritish/GA/trimmomatic/ERR2036633_1_output_forward_paired.fq.gz /home/ritish/GA/trimmomatic/ERR2036633_2_output_reverse_paired.fq.gz > ERR2036633.sam



