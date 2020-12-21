#!/bin/bash
#SBATCH --job-name=flye1      # Job name
#SBATCH --mail-type=ALL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=magitz@ufl.edu    # Where to send mail	
#SBATCH --nodes=1                    # Run all processes on a single node	
#SBATCH --ntasks=1                   # Run a single task		
#SBATCH --cpus-per-task=32            # Number of CPU cores per task
#SBATCH --mem=120gb                    # Job memory request
#SBATCH --time=96:00:00              # Time limit hrs:min:sec
#SBATCH --output=flye_2020-11-11_%j.log     # Standard output and error log
#SBATCH --constraint=hpg2

pwd; hostname; date

echo Running flye

module load flye/2.8.1

flye --nano-raw Bulnesia.2020-11-11.trimmed10kb-passLinux.fastq.gz Bulnesia.2020-11-11.trimmed10kb-skip.fastq.gz\
     -g 500m -o flye_2020-11-11 -t 32 -i 1

date
