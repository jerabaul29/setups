#!/bin/bash -i

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

npm i -g bash-language-server

# add shellcheck linter for bash
sudo apt install shellcheck
