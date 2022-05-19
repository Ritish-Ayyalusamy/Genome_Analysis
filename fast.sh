#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 02:00:00
#SBATCH -J RNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user ritish.ayyalusamy.7872@student.uu.se

#fastQC 

set -x

# FastQ files
cd /home/ritish/GA/fastqc


export SRCDIR=$HOME

# making directory
cd $SNIC_TMP
mkdir RNA_raw_data1
mkdir output1

# changing path
cp  /proj/genomeanalysis2022/Genome_Analysis/2_Christel_2017/RNA_raw_data/* $SNIC_TMP/RNA_raw_data1

# Load modules
module load bioinfo-tools
module load FastQC

# Unzipping Sequencing Files
for f in $SNIC_TMP/RNA_raw_data1/*
do
  	echo "$f"
        gunzip "$f"
done

cd ..
# Going into output

fastqc -o $SNIC_TMP/output1 -f fastq $SNIC_TMP/RNA_raw_data1/*
echo "display output"
ls

# Return
cp $SNIC_TMP/output1/* /home/ritish/GA/fastqc
