#!/bin/sh

#SBATCH --cpus-per-task=8
#SBATCH --mem=32GB
#SBATCH --time=10:00:00
#SBATCH --job-name=auc_test
#SBATCH --gpus=1
#SBATCH --output=/home/users/m/mulligas/test_repo/logs/%A_%a.out
#SBATCH --partition=private-dpnc-gpu,shared-gpu

srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/container.sif \
	      python ~/test_repo/scripts/train.py \
