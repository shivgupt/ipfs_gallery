#!/bin/bash

service='ipfs_daemon'

# Publish Dancce Videos and add links to files


# Delete all old files from posts
rm posts/*

# Convert .md files to .html files
for file in src/*
do
    name=`basename $file .md`
    echo Creating $name.html
    echo "pandoc -s -f markdown -t html -o posts$name.html $file"
    pandoc -s -f markdown -t html -o posts/$name.html $file
done

daemon=`docker inspect --format '{{.Status.ContainerStatus.ContainerID}}' $(docker service ps -q $service | head -n1)`

echo "Found daemon $daemon"

docker exec -it $daemon sh -c 'ipfs name publish --key=blog /ipfs/`ipfs add -r /tmp/posts/ | tail -n 1 | cut -d " " -f 2`'

docker exec -it $daemon sh -c 'ipfs name publish --key=videos /ipfs/`ipfs add -r /tmp/Videos/ | tail -n 1 | cut -d " " -f 2`'
