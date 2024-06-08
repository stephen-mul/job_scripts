#!/bin/sh

#SBATCH --cpus-per-task=16
#SBATCH --mem=32GB
#SBATCH --time=00:10:00
#SBATCH --job-name=train
#SBATCH --output=/home/users/m/mulligas/test_repo/logs/%A_%a.out
#SBATCH --gres=gpu:ampere:1,VramPerGpu:20G
#SBATCH --partition=private-dpnc-gpu

srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/container.sif \
	      python ~/test_repo/scripts/train.py \
