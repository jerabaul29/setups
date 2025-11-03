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

# setup z
git clone https://github.com/rupa/z.git ~/z --depth=1
cat << EOF >> "$HOME/.bashrc"

. "$HOME/z/z.sh"

EOF

# setup my scripts
mkdir "$HOME/my_scripts"
cd "$HOME/my_scripts"

# hg/hx
wget https://raw.githubusercontent.com/jerabaul29/config_scripts_snippets/refs/heads/main/scripts/hist_grep_exec/histg.sh
wget https://raw.githubusercontent.com/jerabaul29/config_scripts_snippets/refs/heads/main/scripts/hist_grep_exec/histx.sh

# zh/zx
wget https://raw.githubusercontent.com/jerabaul29/config_scripts_snippets/refs/heads/main/scripts/z_grep_exec/zg.sh
wget https://raw.githubusercontent.com/jerabaul29/config_scripts_snippets/refs/heads/main/scripts/z_grep_exec/zx.sh

# ga
wget https://raw.githubusercontent.com/jerabaul29/config_scripts_snippets/refs/heads/main/scripts/ga/git_add_commit_push.sh
chmod +x git_add_commit_push.sh

# add all aliases
cat << EOF >> "$HOME/.bashrc"

source "$HOME/my_scripts/zg.sh"
source "$HOME/my_scripts/zx.sh"

source "$HOME/my_scripts/histg.sh"
source "$HOME/my_scripts/histx.sh"

alias ga="$HOME/my_scripts/git_add_commit_push.sh"

EOF

# set up tools I like and use
sudo apt update
sudo apt install tree
sudo apt install fzf

cat << EOF >> "$HOME/.bashrc"

source /usr/share/doc/fzf/examples/key-bindings.bash

EOF

