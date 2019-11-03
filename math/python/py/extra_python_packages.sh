#!/bin/bash

# xgboost and fenics
conda install --yes \
    fenics

python3 -m pip install --no-cache \
    xgboost

# Clinic     
python3 -m pip install --no-cache \
    astropy
conda install --yes -c conda-forge \
    polioastro
    

# slideshows
conda install --yes -c damianavila82 rise
