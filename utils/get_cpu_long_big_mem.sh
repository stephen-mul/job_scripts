#!/bin/sh

salloc -n1 -c12 --partition=public-cpu,shared-cpu --time=08:00:00 --mem=40G
