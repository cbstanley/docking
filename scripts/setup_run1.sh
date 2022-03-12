#!/bin/bash

# HADDOCK bash script

# update path here:
BASE_PATH=path

echo "run from main folder to setup run1 folder"

# need to setup cns (in tcsh) first
#tcsh
# source /$BASE_PATH/cns_solve_1.3/cns_solve_env
#exit

# now can setup haddock
source /$BASE_PATH/haddock2.2/haddock_configure.sh-mac

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
