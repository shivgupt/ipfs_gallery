#!/bin/bash

docker service create \
    --detach \
    --network=bridge \
    --mode=global \
    --name ipfs_daemon \
    --mount type=volume,source=ipfs,destination=/data/ipfs \
    --mount type=bind,source=`pwd`/posts,destination=/tmp/posts \
    --mount type=bind,source=`pwd`/Videos,destination=/tmp/Videos \
    --publish 4001:4001 \
    --publish 4002:4002/udp \
    --publish 8080:8080 \
    --publish 8081:8081 \
    ipfs/go-ipfs

