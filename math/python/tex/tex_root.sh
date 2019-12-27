#!/bin/bash
# Latex-related additions
apt-get update && \
    apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    build-essential \
    locales \
    tzdata \
    lmodern \
    unzip \
    ;

apt-get install -y --no-install-recommends \
    context \
    dvipng \
    fonts-lato \
    fonts-dejavu \
    ghostscript \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-generic-recommended \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-science \
    latexmk \
    ghostscript \
    fonts-lato \
    fonts-dejavu \
    texlive-xetex \
    texlive-luatex \
    ;

# build font caches
mtxrun --script fonts --reload luaotfload-tool --update
