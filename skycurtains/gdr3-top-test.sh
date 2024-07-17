#!/bin/sh

#SBATCH --cpus-per-task=2
#SBATCH --mem=20GB
#SBATCH --time=05:00:00
#SBATCH --job-name=top-test
#SBATCH --gpus=1
#SBATCH --output=/home/users/m/mulligas/skycurtains/logs/%A_%a.out
#SBATCH --partition=public-gpu,shared-gpu

srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/skycurtains_latest.sif \
	      python ~/skycurtains/scripts/sliding_top.py \
	      window_num=4 \
	      network_name="gaiascan_l90.0_b32.23_ra264.69_dec61.05" \
