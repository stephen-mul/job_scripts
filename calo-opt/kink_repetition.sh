#!/bin/sh

#SBATCH --cpus-per-task=8
#SBATCH --mem=32GB
#SBATCH --time=04:00:00
#SBATCH --job-name=kink-rep
#SBATCH --gpus=1
#SBATCH --chdir=/home/users/m/mulligas/calo_working/calo-opt/
#SBATCH --output=/home/users/m/mulligas/calo_working/calo-opt/logs/%A_%a.out
#SBATCH --partition=private-dpnc-gpu,shared-gpu

export XDG_RUNTIME_DIR=""
export PYTHONPATH=${PWD}:${PWD}/python_install:${PYTHONPATH}
srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/jan_framework.sif \
	      python execute.py \
	      --run 3 --experiment kink_repetition --config configs/kink_repetition.yaml
