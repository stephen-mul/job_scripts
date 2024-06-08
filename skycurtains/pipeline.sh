#!/bin/sh

#SBATCH --cpus-per-task=6
#SBATCH --mem=32GB
#SBATCH --time=01:00:00
#SBATCH --job-name=sky-pipeline
#SBATCH --gpus=1
#SBATCH --output=/home/users/m/mulligas/skycurtains/logs/%A_%a.out
#SBATCH --partition=private-dpnc-gpu,shared-gpu

python ~/skycurtains/pipeline.py
