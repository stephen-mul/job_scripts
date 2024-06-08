#!/bin/sh

#SBATCH --job-name=tag-stars
#SBATCH --cpus-per-task=12
#SBATCH --time=4:00:00
#SBATCH --partition=private-dpnc-gpu,shared-gpu
#SBATCH --output=/home/users/m/mulligas/skycurtains/logs/%A_%a.out
#SBATCH --chdir=/home/users/m/mulligas/skycurtains/
#SBATCH --mem=15GB
#SBATCH --gpus=1
#SBATCH --array=0-9

export XDG_RUNTIME_DIR=""
export PYTHONPATH=${PWD}:${PWD}/python_install:${PYTHONPATH}
run_number=(0 1 2 3 4 5 6 7 8 9)
srun apptainer exec --nv -B /srv,/home /home/users/m/mulligas/temp_container/skycurtains.sif \
	   python /home/users/m/mulligas/skycurtains/scripts/tag_stars.py project_name=top_sweep_225 base_dir=/home/users/m/mulligas/scratch/skycurtains/ \
	      run=${run_number[$SLURM_ARRAY_TASK_ID]} \
	         network_name=2024-03-19_01-37-15-342694 \
