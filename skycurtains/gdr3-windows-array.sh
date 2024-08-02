#!/bin/sh

#SBATCH --cpus-per-task=2
#SBATCH --mem=5GB
#SBATCH --time=00:05:00
#SBATCH --job-name=windows-gdr3
#SBATCH --output=/home/users/m/mulligas/skycurtains/logs/%A_%a.out
#SBATCH --partition=shared-cpu,private-dpnc-cpu
#SBATCH --array 0-153

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
	python ~/skycurtains/scripts/get_windows.py \
	network_name="$network_name" \
