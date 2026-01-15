#!/bin/bash -i

# TODO:
# mamba
wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3.sh -b -p "${HOME}/conda"
source "${HOME}/conda/etc/profile.d/mamba.sh"
mamba shell init

# check the channels
# TODO: actually check this for risks to hit paid channels; if so, create alias command that just print a warning and error out
# and make these overwrite the mamba and conda commands
conda config --show channels
mamba config list

# "dev" standard env
mamba create -n dev
mamba activate dev
mamba install -y numpy matplotlib xarray scipy pip

pip install "python-lsp-server[all]"
pip install -U jedi-language-server
pip install python-lsp-ruff
pip install ty

# add hj script for helix
# add lsps for helix to use python

mamba deactivate dev
