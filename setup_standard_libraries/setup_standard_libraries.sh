#!/bin/bash -i

sudo apt update
sudo apt upgrade -y
sudo apt install build-essential libc6-dev -y
sudo apt install libutil-dev librt-dev libpthread-stubs0-dev libm-dev libdl-dev -y
sudo apt install lld -y
