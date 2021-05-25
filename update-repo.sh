#!/bin/bash
source "`dirname $0`/volumesdir.sh"
cd "`dirname $0`"
./reset-repo.sh
docker rm -fv acdh-repo
docker pull acdhch/arche:latest
echo "Repository image updated. Run docker-start.sh to start the repository."
