#!/bin/env zsh

if [ "$EUID" -ne 0 ]; then
    echo "Requires <sudo>"
    exit 1
fi


sudo apt update -y
sudo apt upgrade -y

./nginx.sh
./tailscale.sh
