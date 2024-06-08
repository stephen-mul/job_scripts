#!/bin/sh
#SBATCH --job-name=doping
#SBATCH --cpus-per-task=6
#SBATCH --time=04:00:00
#SBATCH --partition=private-dpnc-gpu,shared-gpu
#SBATCH --output=/home/users/m/mulligas/test_repo/logs/%A_%a.out
#SBATCH --chdir=/home/users/m/mulligas/test_repo/
#SBATCH --mem=24GB
#SBATCH --gpus=1
#SBATCH --array=0-10 #replace this with the total number of jobs


export XDG_RUNTIME_DIR=""
export PYTHONPATH=${PWD}:${PWD}/python_install:${PYTHONPATH}

srun apptainer exec --nv -B /srv,/home /home/users/m/mulligas/temp_container/container.sif \
    wandb agent stephen-mulligan/cwolapp_doping/vg5nz45g --count=1
