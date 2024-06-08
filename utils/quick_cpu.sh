#!/bin/sh

salloc -n1 -c1 --partition=private-dpnc-cpu,public-cpu,shared-cpu --time=00:10:00
