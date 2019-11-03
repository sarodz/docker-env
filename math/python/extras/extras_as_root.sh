#!/bin/bash
# The following are from minimal-notebook:
# if they are already on the system, it shouldn't take up any extra time.
apt-get update && apt-get install -yq --no-install-recommends \
    build-essential \
    emacs \
    git \
    inkscape \
    jed \
    libsm6 \
    libxext-dev \
    libxrender1 \
    lmodern \
    netcat \
    pandoc \
    python-dev \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-xetex \
    tzdata \
    unzip \
    nano

if $INCL_EXTRAS; then 
# The following are things that I personally like having available
    apt-get update && \
        apt-get install -y \
        vim \
        htop \
        qrencode \
        screen \
        tmux \
        imagemagick \
        less \
        curl \
        ;
    
    rm -rf /var/lib/apt/lists/*
    # note that the curl above is for the user, the one below is run by root
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
    dpkg -i ripgrep*.deb
    rm -rf ripgrep*.deb
fi

# TODO:
# Add ripgrep, fzf, fzf shortcuts, etc.
