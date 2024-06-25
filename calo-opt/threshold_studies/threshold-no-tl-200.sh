#!/bin/sh

#SBATCH --cpus-per-task=8
#SBATCH --mem=32GB
#SBATCH --time=06:00:00
#SBATCH --job-name=200-no-tl-thresh
#SBATCH --gpus=1
#SBATCH --chdir=/home/users/m/mulligas/calo_working/threshold-no-tl-200/
#SBATCH --output=/home/users/m/mulligas/calo_working/threshold-no-tl-200/logs/%A_%a.out
#SBATCH --partition=private-dpnc-gpu,shared-gpu

export XDG_RUNTIME_DIR=""
export PYTHONPATH=${PWD}:${PWD}/python_install:${PYTHONPATH}
srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/jan_framework.sif \
	      python execute.py \
	      --run 0 --experiment threshold-no-tl-200 --config configs/threshold-no-tl-200.yaml
