#!/bin/bash
#SBATCH --job-name=minimap      # Job name
#SBATCH --mail-type=ALL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=magitz@ufl.edu    # Where to send mail	
#SBATCH --nodes=1                    # Run all processes on a single node	
#SBATCH --ntasks=1                   # Run a single task		
#SBATCH --cpus-per-task=16            # Number of CPU cores per task
#SBATCH --mem=12gb                    # Job memory request
#SBATCH --time=24:00:00              # Time limit hrs:min:sec
#SBATCH --output=minimap_2020-11-11_%j.log     # Standard output and error log
#SBATCH --constraint=hpg2

pwd; hostname; date

echo Running minimap

module load minimap/2.17

# round1
#minimap2 -t 16 flye_2020-11-11/assembly.fasta ../../Illumina/trimmed_reads/Bulnesia_trim_rename_all.fastq.gz > mapped_Illumina.Bulnesia.2020-11-12.1file.gfa1.paf
 
# round2
minimap2 -t $SLURM_CPUS_PER_TASK Bulnesia.2020-11-25.racon_polish1.fa ../../Illumina/trimmed_reads/Bulnesia_trim_rename_all.fastq.gz > mapped_Illumina.Bulnesia.2020-12-02.round2.paf  
# gzip the output
gzip mapped_Illumina.Bulnesia.2020-12-02.round2.paf

date
