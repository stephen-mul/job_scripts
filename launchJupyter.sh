#!/bin/sh
#
# https://doc.eresearch.unige.ch/hpc/applications_and_libaries#jupyter_notebook
#


#SBATCH --partition=debug-cpu
#SBATCH --time=15:00
#load Anaconda, provides jupyter aswell

module load Anaconda3/2022.05

export XDG_RUNTIME_DIR=""

# specify her the directory containing your notebooks
JUPYTER_NOTEBOOK_DIR="/home/users/m/mulligas/notebooks"

# specify here the port to listen to
PORT=8686

#access jupyternotebook through an ssh tunnel, listen to local host
IP=localhost

srun jupyter notebook --no-browser --port=$PORT --ip=$IP --notebook_dir=$JUPYTER_NOTEBOOK_DIR
