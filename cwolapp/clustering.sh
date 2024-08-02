#!/bin/sh

#SBATCH --mem=40GB
#SBATCH --time=50:00:00
#SBATCH --job-name=clustering
#SBATCH --output=/home/users/m/mulligas/test_repo/logs/clustering_%A_%a.out
#SBATCH --partition=public-cpu,private-dpnc-cpu
#SBATCH --ntasks=4

srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/scwola_container.sif \
	      python ~/test_repo/scripts/clustering.py \
