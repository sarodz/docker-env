#!/bin/bash
# Install packages in default Python 3 environment
# Conda
conda install --yes \
    nodejs \
    matplotlib
# matplotlib with jupyterlab (`%matplotlib widget`)
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install jupyter-matplotlib

# Conda-Forge
conda install --yes -c conda-forge \
    jupyter_contrib_nbextensions \
    ipywidgets \
    ipympl

# Plotly
conda install -c plotly \
    plotly \
    plotly-orca \
    psutil \
    && \
    jupyter labextension install plotlywidget && \
    jupyter labextension install jupyterlab-plotly

# PyPi
python3 -m pip install --no-cache \
    numpy \
    scipy==1.2.* \
    pandas \
    codecov \
    pytest \
    virtualenv

# ==================================== #
# Python 2 environment

if $INCL_PYTHON27; then
    conda create --quiet --yes -p $CONDA_DIR/envs/python2 python=2.7 \
        ipython ipykernel kernda && conda clean --all -f -y
# Install packages in Python 2 environment
    $CONDA_DIR/envs/python2/bin/pip install --no-cache \
       numpy \
       matplotlib \
       scipy==1.2.* \
       pandas \
       ;
fi
