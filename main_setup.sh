#!/bin/bash -i

# fighting bash to make things work in non interactive sessions...
HISTFILE=~/.bash_history
set -o history

###############################################################################
###############################################################################
# the ic scripts to print and debug

# Copyright (c) 2021 Jesús Lázaro
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT


# print file, function name, line, variable and its value
ic () {
    local tmp="${1}[@]"
    echo "(${BASH_SOURCE[1]},${FUNCNAME[1]}) ${BASH_LINENO[0]}: $1 - ${!tmp}"
}

# print file, function name, line, and message string
icp () {
    echo "(${BASH_SOURCE[1]},${FUNCNAME[1]}) ${BASH_LINENO[0]}: $1"
}

# print full call tree and variable and its value
ict () {
    local tmp="${1}[@]"
    for((i=${#BASH_SOURCE[@]}-2;i>=0;i--));
    do
        echo -n "(${BASH_SOURCE[$i+1]},${FUNCNAME[$i+1]}) ${BASH_LINENO[$i]}: "
    done
    echo "$1 - ${!tmp}"
}

# print full call tree and message string
ictp () {
    for((i=${#BASH_SOURCE[@]}-2;i>=0;i--));
    do
        echo -n "(${BASH_SOURCE[$i+1]},${FUNCNAME[$i+1]}) ${BASH_LINENO[$i]}: "
    done
    echo "$1"
}
###############################################################################
###############################################################################

###############################################################################
###############################################################################
# ----------------------------------------
# preamble

# exit if a command fails; to circumvent, can add specifically on commands that can fail safely: " || true "
set -o errexit
# make sure to show the error code of the first failing command
set -o pipefail
# do not overwrite files too easily
# to override the noclobber: >| instead of > only
set -o noclobber
# exit if try to use undefined variable
set -o nounset

# on globbing that has no match, return nothing, rather than return the dubious default ie the pattern itself
# see " help shopt "; use the -u flag to unset (while -s is set)
shopt -s nullglob
###############################################################################
###############################################################################

# ----------------------------------------
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
# setxkbmap no

source "$HOME/.bashrc"
cd ./setup_standard_libraries
# TODO: here and everywhere similar: should I really use source to inherit the definitions etc?
bash setup_standard_libraries.sh
cd "$HOME/Desktop/Git/setups"

source "$HOME/.bashrc"
cd ./setup_command_line
bash setup_command_line.sh
# TODO: dummy git setup
cd "$HOME/Desktop/Git/setups"

source "$HOME/.bashrc"
cd ./setup_tmux
bash setup_tmux.sh
cd "$HOME/Desktop/Git/setups"

source "$HOME/.bashrc"
cd ./setup_rust
bash setup_rust.sh
cd "$HOME/Desktop/Git/setups"

source "$HOME/.bashrc"
cd ./setup_helix
bash setup_helix.sh
cd "$HOME/Desktop/Git/setups"

source "$HOME/.bashrc"
cd ./setup_nvm_npm
bash setup_nvm_npm.sh
cd "$HOME/Desktop/Git/setups"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
npm install -g @github/copilot
history -s "copilot --allow-all-tools"

echo "--- start setup_bash ---"
source "$HOME/.bashrc"
cd ./setup_bash
bash setup_bash.sh
cd "$HOME/Desktop/Git/setups"
history -s "eval \"$(ssh-agent -s)\""
echo "--- done setup_bash ---"

echo "--- start setup_python ---"
source "$HOME/.bashrc"
cd ./setup_python
bash python_dev_setup.sh
cd "$HOME/Desktop/Git/setups"
echo "--- done setup_python ---"

history -w
sleep 10


