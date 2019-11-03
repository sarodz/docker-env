#!/bin/bash
# ==================================== #
# Python 2 environment

conda create --quiet --yes -p $CONDA_DIR/envs/python2 python=2.7 \
        ipython ipykernel kernda && conda clean --all -f -y

# Install packages in Python 2 environment
$CONDA_DIR/envs/python2/bin/pip install --no-cache \
    numpy \
    matplotlib \
    scipy==1.2.* \
    pandas \
    ;
