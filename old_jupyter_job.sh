#!/bin/bash
#SBATCH --job-name=jupyter-nb-job
#SBATCH --cpues-per-task 1
#SBATCH --partition=debug-cpu
#SBATCH --time=10:00
#SBATCH --output=slurm-jupyter.out
#SBATCH --chdir=/home/users/m/mulligas/job_scripts

module load GCCcore/12.2.0 Python/3.10.8
srun apptainer exec \
	-B /home/users/m/mulligas/scratch:/mnt/scratch \
	/home/users/m/mulligas/test_repo/container.sif \
	jupyter notebook --no-browser \
	--ip=$SLURMMD_NODENAME \
	--notebook-dir=$RUNDIR
