#!/bin/sh

salloc -n1 -c2 --partition=private-dpnc-gpu,shared-gpu --time=04:00:00
