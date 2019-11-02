# Final cleaning
# build and clean up (for good measure)
npm cache clean --force && \
    rm -rf /home/$NB_USER/.node-gyp

conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER


