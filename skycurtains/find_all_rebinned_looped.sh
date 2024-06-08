#!/bin/sh
#SBATCH --job-name=find-rebinned
#SBATCH --cpus-per-task=2
#SBATCH --time=02:00:00
#SBATCH --partition=private-dpnc-cpu,shared-cpu
#SBATCH --output=/home/users/m/mulligas/working_sky/skycurtains/logs/%A_%a.out
#SBATCH --chdir=/home/users/m/mulligas/working_sky/skycurtains/
#SBATCH --mem=10GB

export XDG_RUNTIME_DIR=""
export PYTHONPATH=${PWD}:${PWD}/python_install:${PYTHONPATH}
for bin_number in {0..101..1}
do
srun apptainer exec -B /srv,/home /home/users/m/mulligas/temp_container/skycurtains.sif \
	python scripts/stream_finder.py project_name=working_dir \
	network_name=gaiascan_l225.0_b33.7_ra138.1_dec5.7 \
	mode=standard \
	aggregate=max \
	rebin=$bin_number
done
   
