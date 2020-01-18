#!/bin/bash
# Paralellism for Python 2 with MPI
$CONDA_DIR/envs/python2/bin/pip install ipyparallel mpi4py
$CONDA_DIR/envs/python2/bin/ipython profile create --parallel --profile=mpi
$CONDA_DIR/envs/python2/bin/ipython profile create --parallel --profile=default
echo "c.IPClusterEngines.engine_launcher_class = 'MPIEngineSetLauncher'" >> /home/$NB_USER/.ipython/profile_mpi/ipcluster_config.py
