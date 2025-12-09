#!/bin/bash

source ~/.bashrc

# install the general helix configuration
mkdir -p "$HOME/.config/helix/"
cp ./helix_config.toml "$HOME/.config/helix/config.toml"

# install the languages configuration
# note that the main version lives at: https://github.com/helix-editor/helix/blob/master/languages.toml
# and this is just the modifications that should be applied to it (will be merged automatically)
# there may be incompatibilities arising when a new version of helix comes out - if so, edit as needed :) .
cp ./helix_languages.toml "$HOME/.config/helix/languages.toml"

# install the snippets
mkdir -p "$HOME/.config/helix/snippets"
cp ./snippets_python.json "$HOME/.config/helix/snippets/python.json"

mkdir -p "$HOME/Desktop/Software/HelixEditor"
cd "$HOME/Desktop/Software/HelixEditor"

# get helix and make it executable; remember to update both following lines when a new release is available!
wget https://github.com/helix-editor/helix/releases/download/25.07.1/helix-25.07.1-x86_64.AppImage
chmod +x helix-25.07.1-x86_64.AppImage

# install alias
cat << EOF >> "$HOME/.bashrc"

alias hlx="/home/jeanr/Desktop/Software/HelixEditor/helix-25.07.1-x86_64.AppImage"

EOF

# install various LSPs
cargo install --git https://github.com/blopker/codebook codebook-lsp
cargo install --git https://github.com/erasin/hx-lsp hx-lsp

source ~/.bashrc
