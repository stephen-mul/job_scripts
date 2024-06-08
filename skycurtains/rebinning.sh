#!/bin/sh
#SBATCH --job-name=rebinning
#SBATCH --cpus-per-task=2
#SBATCH --time=20:00
#SBATCH --partition=private-dpnc-cpu,shared-cpu
#SBATCH --output=/home/users/m/mulligas/working_sky/skycurtains/logs/%A_%a.out
#SBATCH --chdir=/home/users/m/mulligas/working_sky/skycurtains/
#SBATCH --mem=10GB

export XDG_RUNTIME_DIR=""
export PYTHONPATH=${PWD}:${PWD}/python_install:${PYTHONPATH}
srun apptainer exec -B /srv,/home /home/users/m/mulligas/temp_container/skycurtains.sif \
	   python ~/working_sky/skycurtains/rebinned_analysis/rebinned_analysis.py
