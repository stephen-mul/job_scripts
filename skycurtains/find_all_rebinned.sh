#!/bin/sh
#SBATCH --job-name=find-rebinned
#SBATCH --cpus-per-task=2
#SBATCH --time=20:00
#SBATCH --partition=private-dpnc-cpu,shared-cpu
#SBATCH --output=/home/users/m/mulligas/working_sky/skycurtains/logs/%A_%a.out
#SBATCH --chdir=/home/users/m/mulligas/working_sky/skycurtains/
#SBATCH --mem=10GB
#SBATCH --array=0-101

export XDG_RUNTIME_DIR=""
export PYTHONPATH=${PWD}:${PWD}/python_install:${PYTHONPATH}
bin_number=({0..119..1})

srun apptainer exec -B /srv,/home /home/users/m/mulligas/temp_container/skycurtains.sif \
	python scripts/stream_finder.py \
	network_name=top_117_2024-04-10_11-28-53-548264 \
	mode=standard \
	aggregate=max \
	rebin=${bin_number[$SLURM_ARRAY_TASK_ID]}
   
