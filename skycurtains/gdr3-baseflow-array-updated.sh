#!/bin/sh

#SBATCH --cpus-per-task=8
#SBATCH --mem=20GB
#SBATCH --time=04:00:00
#SBATCH --job-name=array-gdr3-base
#SBATCH --gpus=1
#SBATCH --output=/home/users/m/mulligas/skycurtains/logs/%A_%a.out
#SBATCH --partition=public-gpu,shared-gpu
#SBATCH --array 0-5

### get patch name file path ###
filename="/srv/beegfs/scratch/groups/rodem/skycurtains/gaiadump/patches/patch_names.txt"

### Intialize empty array ###
declare -a file_array

### Read file line by line and sotre each line into the array ###
while IFS= read -r line; do
	file_array+=("$line")
done < "$filename"

srun apptainer exec --nv -B /srv,/home \
	/home/users/m/mulligas/temp_container/skycurtains_latest.sif \
	python ~/skycurtains/scripts/run_curtains.py \
	network_name=${file_array[$SLURM_ARRAY_TASK_ID]}
