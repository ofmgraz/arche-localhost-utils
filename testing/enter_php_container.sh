#/bin/bash

docker run --rm -ti -u $UID --entrypoint bash --network host -v ${PWD}:/data acdhch/arche-filechecker