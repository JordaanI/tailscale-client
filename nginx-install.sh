#!/bin/env zsh

echo "Install mainline nginx"

pacman -Q nginx-mainline >> /dev/null || pacman -S nginx-mainline --noconfirm
./nginx-config.sh /etc/nginx/nginx.conf
