#!/bin/bash
#SBATCH --job-name=bwamem      # Job name
#SBATCH --mail-type=ALL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=magitz@ufl.edu    # Where to send mail	
#SBATCH --nodes=1                    # Run all processes on a single node	
#SBATCH --ntasks=1                   # Run a single task		
#SBATCH --cpus-per-task=16            # Number of CPU cores per task
#SBATCH --mem=32gb                    # Job memory request
#SBATCH --time=48:00:00              # Time limit hrs:min:sec
#SBATCH --output=bwa_2020-11-12_%j.log     # Standard output and error log
#SBATCH --constraint=hpg2

# Commands here are based off of:
#   https://github.com/nanoporetech/ont-assembly-polish/blob/master/analysis.mk
#   This is nanopore's recipe for polishing with medaka

pwd; hostname; date

echo Running bwamem

module load bwa/0.7.17 samtools/1.10

#echo Indexing contigs with bwa

#bwa index flye_2020-11-11/assembly.fasta 

echo Aligning Illumina reads using bwa mem

bwa mem -t $SLURM_CPUS_PER_TASK flye_2020-11-11/assembly.fasta\
    ../../Illumina/trimmed_reads/Bulnesia_R1.trim.fastq.gz\
    ../../Illumina/trimmed_reads/Bulnesia_R2.trim.fastq.gz |\
    samtools view -S -b -u - |\
    samtools sort - -o bwa_aligned_reads.2020-11-12.bam

echo Indexing bam file
samtools index bwa_aligned_reads.2020-11-12.bam

echo done
date
