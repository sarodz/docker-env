#!/bin/bash
# Paralellism for Python 3 with MPI
python3 -m pip install ipyparallel mpi4py
ipython profile create --parallel --profile=mpi
ipython profile create --parallel --profile=default
echo "c.IPClusterEngines.engine_launcher_class = 'MPIEngineSetLauncher'" >> /home/$NB_USER/.ipython/profile_mpi/ipcluster_config.py
