# arche-localhost-utils

a bunch of shell scripts to ease working with arche locally


## how to

* clone the repo
  * ideally into `~/repos/arche` (see`VOLUMES_DIR` in `init-repo.sh` and `docker-start.sh`) or adapt those variables so they match the location of the cloned git-repo
* one time: run `./init-repo` to create needed directories 
* to build/start the continer run `./docker-start.sh`
* (to stop the container run `docker container stop acdh-repo`)
* to remove all data rund `./reset-repo.sh`
* to start again run `./docker-start.sh`

