#!/bin/sh

#SBATCH --cpus-per-task=6
#SBATCH --mem=32GB
#SBATCH --time=01:00:00
#SBATCH --job-name=export_template
#SBATCH --gpus=1
#SBATCH --output=/home/users/m/mulligas/skycurtains/logs/%A_%a.out
#SBATCH --partition=private-dpnc-gpu
#SBATCH --nodelist=gpu002

srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/skycurtains.sif \
	      python ~/skycurtains/scripts/export_template.py \
