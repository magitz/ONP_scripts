#!/bin/bash
#SBATCH --job-name=racon      # Job name
#SBATCH --mail-type=ALL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=magitz@ufl.edu    # Where to send mail	
#SBATCH --nodes=1                    # Run all processes on a single node	
#SBATCH --ntasks=1                   # Run a single task		
#SBATCH --cpus-per-task=30            # Number of CPU cores per task
#SBATCH --mem=180gb                    # Job memory request
#SBATCH --partition=gpu
#SBATCH --gpus=geforce:1
#SBATCH --time=24:00:00              # Time limit hrs:min:sec
#SBATCH --output=racon_2020-11-11_%j.log     # Standard output and error log

pwd; hostname; date

echo Running racon

module load gcc/7.3.0 cuda/10.0.130 

/home/magitz/MyApps/racon/build/bin/racon -c 20 --cudaaligner-batches 20 -t $SLURM_CPUS_PER_TASK\
     ../../Illumina/trimmed_reads/Bulnesia_trim_rename_all.fastq.gz\
    mapped_Illumina.Bulnesia.2020-11-12.1file.gfa1.paf\
    flye_2020-11-11/assembly.fasta
 

date
