#!/bin/sh

srun apptainer exec --nv -B /srv,/home /home/users/m/mulligas/temp_container/container.sif python ~/test_repo/scripts/train.py \
