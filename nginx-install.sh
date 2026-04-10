#!/bin/env zsh

echo "Install mainline nginx"

pacman -Q nginx-mainline >> /dev/null || pacman -S nginx-mainline --no-confirm
./nginx-config.sh /etc/nginx/nginx.conf

sleep 1

echo "Enable and start nginx"
systemctl enable --now nginx
