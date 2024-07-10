#!/bin/sh

#SBATCH --cpus-per-task=8
#SBATCH --mem=20GB
#SBATCH --time=04:00:00
#SBATCH --job-name=gdr3-base
#SBATCH --gpus=1
#SBATCH --output=/home/users/m/mulligas/skycurtains/logs/%A_%a.out
#SBATCH --partition=private-dpnc-gpu,shared-gpu
#SBATCH --exclude=gpu009
#SBATCH --array 0-9

srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/skycurtains_latest.sif \
	      python ~/skycurtains/scripts/run_curtains.py \
	      patch_num=${SLURM_ARRAY_TASK_ID}
