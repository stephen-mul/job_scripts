#!/bin/bash

source ~/test_repo/.venv/bin/activate

 apptainer shell -B /srv,/home --nv --cleanenv --env PYTHONPATH=/home/users/m/mulligas/test_repo/src:/home/users/m/mulligas/test_repo/mltools --bind /srv/beegfs/scratch:/srv/beegfs/scratch /srv/beegfs/scratch/groups/rodem/containers/cwolapp_container.sif
