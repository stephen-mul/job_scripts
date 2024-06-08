#!/bin/sh

#SBATCH --cpus-per-task=2
#SBATCH --mem=20GB
#SBATCH --time=05:00:00
#SBATCH --job-name=base_no_sr
#SBATCH --gpus=1
#SBATCH --output=/home/users/m/mulligas/skycurtains/logs/%A_%a.out
#SBATCH --partition=private-dpnc-gpu,shared-gpu
#SBATCH --exclude=gpu009
#SBATCH --array 0-19

srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/skycurtains.sif \
	      python ~/skycurtains/scripts/sliding_top.py \
	      window_num=${SLURM_ARRAY_TASK_ID}
