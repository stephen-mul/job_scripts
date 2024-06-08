#!/bin/sh

salloc -n1 -c5 --partition=private-dpnc-gpu,shared-gpu --time=04:00:00 --mem=20G --gpus=1
