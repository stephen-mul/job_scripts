#!/bin/sh

#SBATCH --cpus-per-task=11
#SBATCH --mem=32GB
#SBATCH --time=10:00:00
#SBATCH --job-name=train_skycurtains
#SBATCH --gpus=1
#SBATCH --output=/home/users/m/mulligas/skycurtains/logs/%A_%a.out
#SBATCH --partition=private-dpnc-gpu,shared-gpu

srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/skycurtains.sif \
	      python ~/skycurtains/scripts/export_template.py \
