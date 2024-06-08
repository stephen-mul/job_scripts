#!/bin/sh

export XDG_RUNTIME_DIR=""
export PYTHONPATH=${PWD}:${PWD}/python_install:${PYTHONPATH}

srun apptainer exec --nv -B /srv,/home /home/users/m/mulligas/temp_container/skycurtains.sif python ~/working_sky/skycurtains/scripts/rebinned_analysis.py \
