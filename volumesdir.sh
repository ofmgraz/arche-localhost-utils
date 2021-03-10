#!/bin/bash

ENV_FILE="`dirname $0`/.env"
if [ -f "$ENV_FILE" ] ; then
    source "$ENV_FILE"
    echo "Config env vars read from $ENV_FILE"
fi
if [ -z "$VOLUMES_DIR" ] ; then
    read -p "VOLUMES_DIR env var is not set, please provide the installation directory: " VOLUMES_DIR
fi
VOLUMES_DIR="`realpath $VOLUMES_DIR`"
echo "VOLUMES_DIR='$VOLUMES_DIR'" > "$ENV_FILE"
export VOLUMES_DIR
echo "VOLUMES_DIR: $VOLUMES_DIR"
mkdir -p "$VOLUMES_DIR"
