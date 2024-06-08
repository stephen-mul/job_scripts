#!/bin/sh

#SBATCH --cpus-per-task=8
#SBATCH --mem=32GB
#SBATCH --time=04:00:00
#SBATCH --job-name=large-abs
#SBATCH --gpus=1
#SBATCH --chdir=/home/users/m/mulligas/calo_working/calo-opt-base-0.5/
#SBATCH --output=/home/users/m/mulligas/calo_working/calo-opt-base-0.5/logs/%A_%a.out
#SBATCH --partition=private-dpnc-gpu,shared-gpu

export XDG_RUNTIME_DIR=""
export PYTHONPATH=${PWD}:${PWD}/python_install:${PYTHONPATH}
srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/jan_framework.sif \
	      python execute.py \
	      --run 0 --experiment base_variation_0.5 --config configs/box_variation_0.5.yaml
