#!/bin/bash
#SBATCH --job-name=vscode_cpu
#SBATCH --exclude=cpu210
#SBATCH --partition=public-cpu,shared-cpu,private-dpnc-cpu
#SBATCH --time=12:00:00
#SBATCH --mem=30GB
#SBATCH --output=/home/users/m/mulligas/vscode_requests/slurm-%A-%x_%a.out

export XDG_RUNTIME_DIR=""
sleep 12h
