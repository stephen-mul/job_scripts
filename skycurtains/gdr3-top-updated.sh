#!/bin/sh

#SBATCH --cpus-per-task=2
#SBATCH --mem=20GB
#SBATCH --time=05:00:00
#SBATCH --job-name=top-test
#SBATCH --gpus=1
#SBATCH --output=/home/users/m/mulligas/skycurtains/logs/%A_%a.out
#SBATCH --partition=public-gpu,shared-gpu
#SBATCH --array 0

### get patch name file path ###
filename="/srv/beegfs/scratch/groups/rodem/skycurtains/gaiadump/patches/patch_names.txt"

### initialise empty array ###
declare -a file_array

### Read file line by line and store each line in the array ###
while IFS= read -r line;do
	file_array+=("{line%.*}")
done < "$filename"

### get the filename without extension ###
network_name=

network_file=${file_array[4]}

srun apptainer exec --nv -B /srv,/home \
	   /home/users/m/mulligas/temp_container/skycurtains_latest.sif \
	      python ~/skycurtains/scripts/sliding_top.py \
	      window_num=4 \
	      network_name="gaiascan_l90.0_b32.23_ra264.69_dec61.05" \
