#!/bin/sh
#SBATCH --job-name=base_patch_sweep
#SBATCH --cpus-per-task=12
#SBATCH --time=10:00:00
#SBATCH --partition=private-dpnc-gpu,shared-gpu
#SBATCH --output=/home/users/m/mulligas/skycurtains/logs/%A_%a.out
#SBATCH --chdir=/home/users/m/mulligas/skycurtains/
#SBATCH --mem=16GB
#SBATCH --gpus=1
#SBATCH --array=0-7 #replace this with the total number of jobs


export XDG_RUNTIME_DIR=""
export PYTHONPATH=${PWD}:${PWD}/python_install:${PYTHONPATH}

srun apptainer exec --nv -B /srv,/home /home/users/m/mulligas/temp_container/skycurtains.sif \
   wandb agent stephen-mulligan/skycurtains_patches/84qd259n --count=1
