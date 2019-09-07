#!/bin/bash

while IFS= read -r line
do
    echo "Processing $line"
    curl -s https://raw.githubusercontent.com/$line/bookshelf/master/bookshelf.yml > cache/$line.yml
    mkdir -p output/$line
    npx bookshelf-engine build -t bookshelf.mustache -o output/$line/index.html cache/$line.yml
done < users
