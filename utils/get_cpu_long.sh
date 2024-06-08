#!/bin/sh

salloc -n1 -c11 --partition=private-dpnc-cpu,public-cpu,shared-cpu --time=08:00:00
