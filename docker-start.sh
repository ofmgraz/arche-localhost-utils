#!/bin/sh
VOLUMES_DIR=~/repos/arche/repo
docker run --name acdh-repo --rm -p 80:80 -v $VOLUMES_DIR/data:/home/www-data/data -v $VOLUMES_DIR/tmp:/home/www-data/tmp -v $VOLUMES_DIR/postgresql:/home/www-data/postgresql -v $VOLUMES_DIR/log:/home/www-data/log -v $VOLUMES_DIR/vendor:/home/www-data/vendor -v $VOLUMES_DIR/config:/home/www-data/config -v $VOLUMES_DIR/gui:/home/www-data/gui -e USER_UID=`id -u` -e USER_GID=`id -g` acdhch/arche

