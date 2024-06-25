#!/bin/sh

#SBATCH --cpus-per-task=8
#SBATCH --mem=32GB
#SBATCH --time=01:00:00
#SBATCH --job-name=400-timing
#SBATCH --gpus=1
#SBATCH --chdir=/home/users/m/mulligas/calo_working/timing_study_400/
#SBATCH --output=/home/users/m/mulligas/calo_working/timing_study_400/logs/%A_%a.out
#SBATCH --partition=private-dpnc-gpu,shared-gpu

export XDG_RUNTIME_DIR=""
export PYTHONPATH=${PWD}:${PWD}/python_install:${PYTHONPATH}
srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/jan_framework.sif \
	      python execute.py \
	      --run 0 --experiment timing_study_400 --config configs/timing_study_400.yaml
