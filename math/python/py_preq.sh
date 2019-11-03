#!/bin/bash

# Parallelism 
# apt-get install -y --no-install-recommends mpich libmpich-dev

# Latex-related additions
# the following do not appear in docker-stacks/minimal-notebook:
#apt-get update && \
#    apt-get install -y --no-install-recommends \
#    context \
#    dvipng \
#    fonts-lato \
#    fonts-dejavu \
#    ghostscript \
#    # texlive \
#    texlive-latex-recommended \
#    texlive-luatex \
#    texlive-science \
#    latexmk \
#    ;

## build font caches
# mtxrun --script fonts --reload luaotfload-tool --update
