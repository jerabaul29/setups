# Setups

My standard setups on my machine. Typically used on fresh Ubuntu installs. Assumes that it will be run non-interactive, with an empty sudo password, at the early stage of machine setup.

The main work script `main_setup.sh` assumes that this repository is cloned in `$HOME/Desktop/Git/setups`, for example clone and install as:

```bash
mkdir -p "$HOME/Desktop/Git"
cd "$HOME/Desktop/Git"
git clone https://github.com/jerabaul29/setups.git
cd setups
bash main_setup.sh
```

The helper `main.sh` script should work from any location and calls `main_setup.sh`.
