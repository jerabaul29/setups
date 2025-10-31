#!/bin/bash

# setup https://github.com/magicmonty/bash-git-prompt
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

cat << EOF >> "$HOME/.bashrc"

# set up truecolor, needed for example for helix
export COLORTERM="truecolor"

# set up gitprompt
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=0
    GIT_PROMPT_THEME=Single_line_Dark  # this one is nice
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

EOF
