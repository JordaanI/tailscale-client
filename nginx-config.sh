#!/bin/env zsh

path=/etc/nginx/nginx.conf

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
writeProxy "6969" "calibre"
writeProxy "2342" "photoprism"

fecho "}"

echo "Finished nginx config"
