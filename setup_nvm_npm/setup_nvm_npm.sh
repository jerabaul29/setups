#!/bin/bash -i

echo "install nvm, node, copilot cli"
echo "--- nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
# sourcing is the usual way to do it, but does not work within the script (probably because of bashrc interactive session check)
# source ~/.bashrc
# load nvm explicitly!
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
echo "--- node"
nvm install node
