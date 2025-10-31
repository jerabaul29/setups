#!/bin/bash

# check if tmux is installed; if not, install
if command -v tmux &> /dev/null; then
  echo "tmux is installed."
else
  echo "tmux is not installed."
  echo "install it now"
  sudo apt update && sudo apt install -y tmux
fi

cd "$HOME"
git clone --single-branch https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp "$HOME"/Desktop/Git/setups/setup_tmux/tmux.conf.local .tmux.conf.local
