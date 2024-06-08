#!/bin/bash
#SBATCH --job-name=vscode_gpu
#SBATCH --partition=shared-gpu,private-dpnc-gpu
#SBATCH --time=10:00:00
#SBATCH --mem=30GB
#SBATCH --output=/home/users/m/mulligas/vscode_requests/slurm-%A-%x_%a.out
#SBATCH --gpus=1
#SBATCH --ntasks=2

export XDG_RUNTIME_DIR=""
sleep 12h
