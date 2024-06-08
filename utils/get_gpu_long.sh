#!/bin/sh

salloc -n1 -c11 --partition=private-dpnc-gpu,shared-gpu --time=10:00:00 --mem=15G --gpus=1
