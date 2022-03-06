#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Generates the tbl restraints to use as unambiguous restraints with haddock.

"""

import numpy as np


# load data output from pdb_dist.py
data = np.loadtxt('dist_output.txt', usecols=(2, 7, 10))

tbl = ('!\n' +
       '! HADDOCK AIR restraints for 1st molecule \n' +
       '!\n'
       )

segid = '  and segid A and name P) \n'

# defines the -/+ on target distance
distances = ' 6.0 5.0'

i = 0

while i < len(data):
    tbl += ('! \n' +
               'assign ( resid ' + str(int(data[i, 0])) + segid +
               '       ( \n' +
               '        ( resid ' + str(int(data[i, 1])) + segid +
               '       )  ' + str(data[i, 2]) + distances + '\n'
               )

    # reciprocates the restraint
    tbl += ('! \n' +
               'assign ( resid ' + str(int(data[i, 1])) + segid +
               '       ( \n' +
               '        ( resid ' + str(int(data[i, 0])) + segid +
               '       )  ' + str(data[i, 2]) + distances + '\n'
               )

    i += 1

print(tbl)
