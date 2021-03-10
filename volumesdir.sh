#!/bin/bash

ENV_FILE="`dirname $0`/.env"
if [ -f "$ENV_FILE" ] ; then
    source "$ENV_FILE"
    echo "Config env vars read from $ENV_FILE"
fi
if [ -z "$VOLUMES_DIR" ] ; then
    read -p "VOLUMES_DIR env var is not set, please provide the installation directory: " VOLUMES_DIR
fi
VOLUMES_DIR="`echo "$VOLUMES_DIR" | sed -e "s|^~|$HOME|g"`"
VOLUMES_DIR="`realpath -m "$VOLUMES_DIR"`"
mkdir -p "$VOLUMES_DIR" || exit 1
echo "VOLUMES_DIR: $VOLUMES_DIR"
echo "VOLUMES_DIR='$VOLUMES_DIR'" > "$ENV_FILE"
export VOLUMES_DIR
