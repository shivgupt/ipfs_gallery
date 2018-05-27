#!/bin/bash

key="videos"

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

latest_hash=`ipfs add -r posts/ | tail -n 1 | cut -d " " -f 2`

ipfs name publish --key=${key} /ipfs/$latest_hash
