#!/bin/env zsh

path="$1"

if [ -z $path ]; then
    echo "Needs Path"
    exit 1
fi

fecho() {
    echo "$1" >> $path
}

writeProxy() {
    fecho "server {"
    fecho "listen $1;"
    fecho "server_name $2;"
    fecho ""
    fecho "location / { proxy_pass http://bee:$1; }"
    fecho "}"
    fecho ""
}


echo "" > $path

fecho "user http;"
fecho "worker_processes 4;"
fecho ""

fecho "events { worker_connections 1024; }"
fecho ""
fecho "http {"

writeProxy "8096" "jellyfin"
writeProxy "9000" "mealie"

fecho "}"

echo "Finished nginx config"
