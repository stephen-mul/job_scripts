#!/bin/sh

#SBATCH --cpus-per-task=8
#SBATCH --mem=20GB
#SBATCH --time=04:00:00
#SBATCH --job-name=array-gdr3-base
#SBATCH --gpus=1
#SBATCH --output=/home/users/m/mulligas/skycurtains/logs/%A_%a.out
#SBATCH --partition=shared-gpu,private-dpnc-gpu
#SBATCH --array 130-153

### get patch name file path ###
filename="/srv/beegfs/scratch/groups/rodem/skycurtains/gdr3_patch_names/patch_names.txt"

### Intialize empty array ###
declare -a file_array

### Read file line by line and sotre each line into the array ###
while IFS= read -r line; do
	file_array+=("${line%.*}")
done < "$filename"

### Get the filename with and without the extension ###
network_name=${file_array[$SLURM_ARRAY_TASK_ID]}
file_name=${network_name}.h5

srun apptainer exec --nv -B /srv,/home \
	/home/users/m/mulligas/temp_container/skycurtains_latest.sif \
	python ~/skycurtains/scripts/run_curtains.py \
	network_name="$network_name" \
	datamodule.data_config.file_name="$file_name" \
	datamodule.data_config.context="pm_lon_coslat"
