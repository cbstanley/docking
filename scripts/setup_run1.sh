#!/bin/bash

# HADDOCK bash script

echo "run from main folder to setup run1 folder"

# need to setup cns (in tcsh) first
#tcsh
#source /<path>/cns_solve_1.3/cns_solve_env
#exit

# now can setup haddock
source /<path>/haddock2.2/haddock_configure.sh-mac

# remove and regenerate run1 folder, if already exists
rm -r run1
haddock2.2

# copy all needed files into run1
cp ligand.* run1/toppar
cp numtrees.cns run1/protocols
cp run_1000.cns run1/run.cns

# go into run1 and run
cd run1
haddock2.2
