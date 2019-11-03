#!/bin/bash
# Paralellism for Python 3 with MPI
python3 -m pip install ipyparallel
jupyter serverextension enable --py ipyparallel
jupyter nbextension install --py ipyparallel
jupyter nbextension enable --py ipyparallel

#ipython profile create --parallel --profile=default

python3 -m pip install mpi4py
ipython profile create --parallel --profile=mpi
echo "c.IPClusterEngines.engine_launcher_class = 'MPIEngineSetLauncher'" >> /home/$NB_USER/.ipython/profile_mpi/ipcluster_config.py
