#!/bin/bash

curl https://sh.rustup.rs -sSf | sh -s -- -y

cat << EOF >> "$HOME/.bashrc"

. "$HOME/.cargo/env"

EOF

source "$HOME/.bashrc"
