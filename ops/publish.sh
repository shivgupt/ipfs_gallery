#!/bin/bash

service='ipfs_daemon'
category='videos'
index="$HOME/ipfs/$category/index.html"
touch $index

daemon=`docker inspect --format '{{.Status.ContainerStatus.ContainerID}}' $(docker service ps -q $service | head -n1)`

echo "Found daemon $daemon"

if [[ -z "`ipfs key list | grep $category`" ]]; then ipfs key gen --type=rsa --size=2048 $category; fi

for dir in "$@"
do
    hash=`docker exec -it $daemon sh -c "ipfs add -r -q /ipfs/$category/$dir | tail -n 1 | tr -d '\n\r'"`
    if [[ -z "`cat $index | grep $hash`" ]]
    then
        echo '<a href="https://gateway.ipfs.io/ipfs/'"$hash"'">'"$dir"'</a> '"$hash" >> $index
        echo "Added $dir $hash"
    fi
done

echo 'Publishing... '
docker exec -it $daemon sh -c 'ipfs name publish --key='"$category"' /ipfs/`ipfs add -q /ipfs/'"$category"'/index.html | tail -n 1`'
