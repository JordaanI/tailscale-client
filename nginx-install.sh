#!/bin/env zsh

echo "Install mainline nginx"

## create nginx user
useradd http

## install nginx
apt install nginx -y

## Enable the thing
systemctl enable -now nginx

## Config
./nginx-config.sh
