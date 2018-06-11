#!/bin/bash

ipfs_mountpoint=$HOME/ipfs

docker service create \
    --detach \
    --network=bridge \
    --restart-condition any \
    --mode=global \
    --name ipfs_daemon \
    --mount type=volume,source=ipfs,destination=/data/ipfs \
    --mount type=bind,source=$ipfs_mountpoint,destination=/ipfs \
    --publish 4001:4001 \
    --publish 4002:4002/udp \
    --publish 8080:8080 \
    --publish 8081:8081 \
    ipfs/go-ipfs

