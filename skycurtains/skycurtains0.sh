#!/bin/sh

#SBATCH --cpus-per-task=6
#SBATCH --mem=30GB
#SBATCH --time=12:00:00
#SBATCH --job-name=base_no_sr
#SBATCH --gpus=1
#SBATCH --output=/home/users/m/mulligas/skycurtains/logs/%A_%a.out
#SBATCH --partition=private-dpnc-gpu,shared-gpu
#SBATCH --exclude=gpu009

srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/skycurtains.sif \
	      python ~/skycurtains/scripts/run_curtains.py \
