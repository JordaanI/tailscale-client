#!/bin/env zsh

if [ "$EUID" -ne 0 ]; then
    echo "Requires <sudo>"
    exit 1                                                                                                                              
fi

./nginx.sh
./tailscale.sh

echo "Enable and start nginx"
systemctl enable --now nginx
