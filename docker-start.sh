#!/bin/bash
source "`dirname $0`/volumesdir.sh"
cd "`dirname $0`"
INIT_LOG="$VOLUMES_DIR/log/initScripts.log"

if [ "`docker ps | grep " acdh-repo$" | wc -l`" == "1" ] ; then
    echo "Repository container already running"
    exit 0
fi

rm -f "$INIT_LOG"
docker start acdh-repo 2>/dev/null
if [ "$?" != "0" ] ; then
    echo "Container doesn't exist, creating"
    docker run --name acdh-repo -d -p 80:80 -v $VOLUMES_DIR/data:/home/www-data/data -v $VOLUMES_DIR/tmp:/home/www-data/tmp -v $VOLUMES_DIR/postgresql:/home/www-data/postgresql -v $VOLUMES_DIR/log:/home/www-data/log -v $VOLUMES_DIR/vendor:/home/www-data/vendor -v $VOLUMES_DIR/config:/home/www-data/config -e USER_UID=`id -u` -e USER_GID=`id -g` acdhch/arche:focal
else
    echo "Existing container started"
fi

while [ "`grep '# INIT SCRIPTS ENDED' "$INIT_LOG" 2>/dev/null | wc -l`" != "1" ]; do
    echo "Waiting until repository is ready..."
    if [ -f "$INIT_LOG" ] ; then
        grep '^# ' "$INIT_LOG"
    else
        docker logs acdh-repo 2>&1 | tail -n 1
    fi
    echo ""
    sleep 5
done
grep '^# ' "$INIT_LOG"

