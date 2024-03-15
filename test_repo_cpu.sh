#!/bin/sh

#SBATCH --mem=32GB
#SBATCH --time=00:20:00
#SBATCH --job-name=train
#SBATCH --output=/home/users/m/mulligas/test_repo/logs/%A_%a.out
#SBATCH --partition=public-cpu,shared-cpu,private-dpnc-cpu

srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/container.sif \
	      python ~/test_repo/scripts/train.py \
