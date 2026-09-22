#!/bin/bash
#SBATCH --time="24:00:00"
#SBATCH --mem=24G
#SBATCH --output=logs/slurm-%j.log
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --signal=B:TERM@60
#SBATCH --job-name=nf_atac
#SBATCH --mail-type ALL
#SBATCH --mail-user UNIQNAME@umich.edu
#SBATCH --account=account

module load openjdk
module load singularity/3.11.1
export WORKDIR=/scratch/xx_root/xx0/UNIQNAME/YYYY_MM_project-description
exec nextflow run -resume -params-file $WORKDIR/configs/library-config.json --results $WORKDIR/results/atacseq/ /home/UNIQNAME/github/ATACseq-NextFlow/main.nf
