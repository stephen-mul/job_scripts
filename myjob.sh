#!/bin/bash
#SBATCH --job-name=jb-submit-test
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 1
#SBATCH --partition=debug-gpu
#SBATCH --time=02:00
#SBATCH --output=slurm-test.out
#SBATCH --chdir=/home/users/m/mulligas/test_repo

module load GCCcore/12.2.0 Python/3.10.8
srun apptainer exec --nv \
	-B /home/users/m/mulligas/scratch:/mnt/scratch \
	/home/users/m/mulligas/test_repo/container.sif python train.py
