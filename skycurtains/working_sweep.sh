#!/bin/sh
#SBATCH --job-name=117-top-sweep
#SBATCH --cpus-per-task=3
#SBATCH --time=10:00:00
#SBATCH --partition=private-dpnc-gpu,shared-gpu
#SBATCH --output=/home/users/m/mulligas/working_sky/sweeps/skycurtains/logs/%A_%a.out
#SBATCH --chdir=/home/users/m/mulligas/working_sky/sweeps/skycurtains/
#SBATCH --mem=16GB
#SBATCH --gpus=1
#SBATCH --array=0-20 #replace this with the total number of jobs


export XDG_RUNTIME_DIR=""
export PYTHONPATH=${PWD}:${PWD}/python_install:${PYTHONPATH}

srun apptainer exec --nv -B /srv,/home /home/users/m/mulligas/temp_container/skycurtains.sif \
    wandb agent stephen-mulligan/skycurtains_patches/pkk4k9oo --count=1
