#!/bin/bash

# install the configuration
mkdir -p "$HOME/.config/helix/"
cp ./helix_config.toml "$HOME/.config/helix/config.toml"

mkdir -p "$HOME/Desktop/Software/HelixEditor"
cd "$HOME/Desktop/Software/HelixEditor"

# get helix and make it executable; remember to update both following lines when a new release is available!
wget https://github.com/helix-editor/helix/releases/download/25.07.1/helix-25.07.1-x86_64.AppImage
chmod +x helix-25.07.1-x86_64.AppImage

# install alias
cat << EOF >> "$HOME/.bashrc"

alias hlx="/home/jeanr/Desktop/Software/HelixEditor/helix-25.07.1-x86_64.AppImage"

EOF

