#!/bin/sh

#SBATCH --cpus-per-task=8
#SBATCH --mem=32GB
#SBATCH --time=10:00:00
#SBATCH --job-name=calo-opt
#SBATCH --gpus=1
#SBATCH --output=/home/users/m/mulligas/calo-opt/modules_3/logs/%A_%a.out
#SBATCH --partition=private-dpnc-gpu,shared-gpu
#SBATCH --array=0-4

srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/jan_framework.sif \
	      python ~/calo-opt/modules_3/execute.py \
	      run=${SLURM_ARRAY_TASK_ID}\
