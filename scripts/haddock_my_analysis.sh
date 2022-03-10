#!/bin/tcsh

# script to perform haddock analysis post-run

# tcsh

cd run1/structures/it1/water
$HADDOCKTOOLS/ana_structures.csh

cd analysis
gunzip cluster.out.gz
cd ..
$HADDOCKTOOLS/ana_clusters.csh -best 4 analysis/cluster.out

echo "Most useful files are:"
echo "structures_haddock-sorted.stat"
echo "clusters_haddock-sorted.stat_best4"
