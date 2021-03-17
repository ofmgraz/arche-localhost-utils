#!/bin/bash
source "`dirname $0`/volumesdir.sh"
cd "`dirname $0`"
git clone https://github.com/acdh-oeaw/arche-docker-config.git -b arche $VOLUMES_DIR/config
cp users.yaml "$VOLUMES_DIR/config/initScripts/users.yaml"
cp custom_config/dissServices.ttl "$VOLUMES_DIR/config/initScripts/dissServices.ttl"
for i in data tmp postgresql log vendor gui; do
    mkdir -p "$VOLUMES_DIR/$i"
done

