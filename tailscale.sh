#!/bin/sh

echo "Installing tailscale"

## Get Deps
apt install lsb-release curl -y

## Add to repo
curl -L https://pkgs.tailscale.com/stable/raspbian/$(lsb_release -cs).noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null

## Get Keys
echo "deb [signed-by=/usr/share/keyrings/tailscale-archive-keyring.gpg] https://pkgs.tailscale.com/stable/raspbian $(lsb_release -cs) main" | sudo tee  /etc/apt/sources.list.d/tailscale.list

## Update repo
apt update -y

## install Tailscale
apt install tailscale -y

startTailscale() {
    echo "Setting up tailscale"
    systemctl enable --now tailscaled
    echo $(tailscale up --ssh) > tailscale-login.txt
    echo "You're done"
    cat tailscale-login.txt
}

if [[ $(timedatectl | grep clock | grep yes) ]]; then
    startTailscale
else
    timedatectl set-ntp true
    startTailscale
fi
