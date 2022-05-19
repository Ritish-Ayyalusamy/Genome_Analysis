#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 02:00:00
#SBATCH -J Posttrimqc
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se

#FastQC
set -x

cd /home/ritish/GA/fastqc/fastqcpost

# directory 
export SRCDIR=$HOME

#directory
cd $SNIC_TMP
mkdir RNA
mkdir out

#external directory
cp  /home/ritish/GA/trimmomatic/*.fq* \
$SNIC_TMP/RNA

# Load modules
module load bioinfo-tools
module load FastQC



fastqc -o $SNIC_TMP/out -f fastq $SNIC_TMP/RNA/*


cp $SNIC_TMP/out/* /home/ritish/GA/fastqc/fastqcpost
