#!/bin/sh

#SBATCH --cpus-per-task=8
#SBATCH --mem=32GB
#SBATCH --time=04:00:00
#SBATCH --job-name=low-vals
#SBATCH --gpus=1
#SBATCH --chdir=/home/users/m/mulligas/calo_working/calo-opt-low-vals/
#SBATCH --output=/home/users/m/mulligas/calo_working/calo-opt-low-vals/logs/%A_%a.out
#SBATCH --partition=private-dpnc-gpu,shared-gpu

export XDG_RUNTIME_DIR=""
export PYTHONPATH=${PWD}:${PWD}/python_install:${PYTHONPATH}
srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/jan_framework.sif \
	      python execute.py \
	      --run 0 --experiment abs0.1_scint_0.1_box_1.5 --config configs/abs0_0.1_scint0_0.1_box_1.5.yaml
