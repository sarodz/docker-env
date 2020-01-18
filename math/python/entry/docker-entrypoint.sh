#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

set -e

# If the run command is the default, do some initialization first
if [ "$(which "$1")" = "/usr/local/bin/start-singleuser.sh" ]; then
  # Clone sample notebooks to user's notebook directory.  Assume $NB_USER's work
  # directory if notebook directory not explicitly set.  `git clone` will fail
  # if target directory already exists and is not empty, which likely means
  # that we've already done it, so just ignore.
  #: ${NOTEBOOK_DIR:=/home/$NB_USER/work}
  NOTEBOOK_DIR=/home/$NB_USER
  git clone https://gist.github.com/mathematicalmichael/4190e1fae7627a5436d30c24f8dc0e7c \
    --depth 1 \
    "/home/$NB_USER/startup_scripts" || true
  # add any additional startup hooks here.
  pip install -r $NOTEBOOK_DIR/startup_scripts/requirements.txt 
  bash $NOTEBOOK_DIR/startup_scripts/setup.sh
fi

# Run the command provided
exec "$@"
