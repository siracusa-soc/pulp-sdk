#!/bin/bash

NB_CORES=2
# BUILD_DIR=/scratch/prasadar/GVSOC/siracusa_port/pulp-sdk/tests/

 nice -n10 sw/bwruntests.py --report-junit -t 180 --yaml -o camera_out.xml -p ${NB_CORES} tests/simple.yaml -s 
 if test $? -ne 0; then
     exit 1
 fi