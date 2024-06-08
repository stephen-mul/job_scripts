#!/bin/sh

#SBATCH --mem=32GB
#SBATCH --time=00:10:00
#SBATCH --job-name=test_top
#SBATCH --output=/home/users/m/mulligas/skycurtains/logs/%A_%a.out
#SBATCH --partition=public-cpu,shared-cpu,private-dpnc-cpu

srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/skycurtains.sif \
	      python ~/skycurtains/scripts/run_curtains.py \
