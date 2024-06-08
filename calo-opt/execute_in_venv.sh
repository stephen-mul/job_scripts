#!/bin/sh

salloc -n1 -c2 --partition=private-dpnc-gpu,shared-gpu --time=10:00 --mem=15G --gpus=1

apptainer shell --nv ~/temp_container/jan_framework.sif

#source ~/calo-opt/calo-opt/bin/activate
