#!/bin/sh

srun apptainer exec --nv -B /srv,/home /home/users/m/mulligas/temp_container/skycurtains.sif python ~/skycurtains/scripts/tag_stars.py
