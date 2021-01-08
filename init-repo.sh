#!/bin/sh
VOLUMES_DIR=~/repos/arche/repo
git clone https://github.com/acdh-oeaw/arche-docker-config.git -b arche $VOLUMES_DIR/config
cp users.yaml ./repo/config/initScripts/users.yaml
cp custom_config/dissServices.ttl ./repo/config/initScripts/dissServices.ttl
for i in data tmp postgresql log vendor gui; do
    mkdir -p $VOLUMES_DIR/$i
done

