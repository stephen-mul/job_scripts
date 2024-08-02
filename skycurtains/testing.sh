#!/bin/sh

### get patch name file path ###
filename="/srv/beegfs/scratch/groups/rodem/skycurtains/gaiadump/patches/patch_names.txt"

### Intialize empty array ###
declare -a file_array

### Read file line by line and sotre each line into the array ###
while IFS= read -r line; do
	file_array+=("${line%.*}")
done < "$filename"

### Get the filename with and without the extension ###
for index in "${!file_array[@]}"; do
	echo "Index: $index, Value: ${file_array[$index]}"
done
#network_name=${file_array[$SLURM_ARRAY_TASK_ID]}
#file_name=${network_name}.h5
