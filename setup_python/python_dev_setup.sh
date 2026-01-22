#!/bin/bash -i

# mamba from conda-forge: only use the conda-forge channel, do NOT use the paid Anaconda Inc channels
wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3.sh -b -p "${HOME}/conda"
source "${HOME}/conda/etc/profile.d/mamba.sh"
mamba shell init

# check the channels
conda config --show channels
mamba config list

# create a "dev" standard env
mamba create -n dev
mamba activate dev
mamba install -y numpy matplotlib xarray scipy pip ipython pandas

pip install "python-lsp-server[all]"
pip install -U jedi-language-server
pip install python-lsp-ruff
pip install ty

mamba deactivate dev

# add hj script for helix
CRRT_DIR="$pwd"
mkdir -p "$HOME/my_scripts"
cd "$HOME/my_scripts"
wget https://raw.githubusercontent.com/jerabaul29/config_scripts_snippets/refs/heads/main/scripts/helix_and_repl/helix_and_repl.sh
chmod +x helix_and_repl.sh
cat << EOF >> "$HOME/.bashrc"

alias hj="$HOME/my_scripts/helix_and_repl.sh"

EOF
cd "$CRRT_DIR"

