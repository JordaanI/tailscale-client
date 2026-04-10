#!/bin/env zsh

echo "Installing tailscale"

pacman -Q tailscale || pacman -S tailscale --no-confirm

echo "Checking Sync"

startTailscale() {
    echo "Setting up tailscale"
    systemctl enable --now tailscaled
    echo $(tailscale up) > tailscale-login.txt
    echo "You're done"
    cat tailscale-login.txt
}

if [[ $(timedatectl | grep clock | grep yes) ]]; then
    startTailscale
else
    timedatectl set-ntp true
    startTailscale
fi
