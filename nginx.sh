#!/bin/env zsh

if [ "$EUID" -ne 0 ]; then
  echo "Requires <sudo>"
  exit 1
fi

./nginx-install.sh
