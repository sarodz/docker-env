#!/bin/bash
# visual git manager
jupyter labextension install @jupyterlab/git && \
    python3 -m pip install --upgrade jupyterlab-git && \
    jupyter serverextension enable --py jupyterlab_git

# things to make the lab environment better.
jupyter labextension install jupyterlab-drawio
jupyter labextension install jupyterlab-topbar-extension
# this isn't working
jupyter labextension install jupyterlab-system-monitor

# LaTeX capabilities
python3 -m pip install --no-cache \
    jupyterlab_latex \
jupyter labextension install @jupyterlab/latex
jupyter labextension install @lckr/jupyterlab_variableinspector

# notebook extensions
jupyter nbextension enable snippets_menu/main
jupyter nbextension enable codefolding/main
jupyter nbextension enable codefolding/edit
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension enable notify/notify
jupyter nbextension enable rubberband/main
jupyter nbextension enable varInspector/main
jupyter nbextension enable latex_envs/latex_envs
jupyter nbextension enable load_tex_macros/main
jupyter nbextension enable toc2/main


