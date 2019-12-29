#!/bin/bash
# the fastest search
apt-get update && \
    apt-get install -y --no-install-recommends \
    curl

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
dpkg -i ripgrep*.deb
rm -rf ripgrep*.deb
# fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
apt-get remove -y --purge curl
