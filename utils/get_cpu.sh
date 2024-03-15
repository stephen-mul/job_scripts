#!/bin/sh

salloc -n1 -c2 --partition=private-dpnc-cpu,public-cpu,shared-cpu --time=04:00:00
