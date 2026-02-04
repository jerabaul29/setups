#!/bin/bash -i

gsettings set org.gnome.desktop.interface color-scheme prefer-dark
# setxkbmap no

source "$HOME/.bashrc"
cd ./setup_standard_libraries
bash setup_standard_libraries.sh
cd "$HOME/Desktop/Git/setups"

source "$HOME/.bashrc"
cd ./setup_command_line
bash setup_command_line.sh
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

source "$HOME/.bashrc"
cd ./setup_bash
bash setup_bash.sh
cd "$HOME/Desktop/Git/setups"

source "$HOME/.bashrc"
cd ./setup_python
bash python_dev_setup.sh
cd "$HOME/Desktop/Git/setups"


