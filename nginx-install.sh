#!/bin/env zsh

echo "Install mainline nginx"

pacman -Q nginx-mainline >> /dev/null || pacman -S nginx-mainline
./nginx-config.sh /etc/nginx/nginx.conf

echo "Enable and start nginx"
systemctl enable --now nginx
