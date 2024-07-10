#!/bin/sh

#SBATCH --cpus-per-task=2
#SBATCH --mem=20GB
#SBATCH --time=00:30:00
#SBATCH --job-name=debug-no-sr
#SBATCH --gpus=1
#SBATCH --output=/home/users/m/mulligas/skycurtains/logs/%A_%a.out
#SBATCH --partition=private-dpnc-gpu,shared-gpu
#SBATCH --exclude=gpu009

srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/skycurtains.sif \
	      python /home/users/m/mulligas/skycurtains/scripts/run_curtains.py \
