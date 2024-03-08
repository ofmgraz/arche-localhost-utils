# arche-localhost-utils

A bunch of shell scripts to ease working with arche locally

## i don't want to type `sudo` all the time

on default you can execute docker related commands only with `sudo`; to change this you have a look at https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user (TLDR, create a `docker` group and add you user to it; restart the system)

## how to install

* Clone the repo
* One time: run `./init-repo.sh` to create needed directories 
  * answer `VOLUMES_DIR env var is not set, please provide the installation directory:` with `.`
* To (re)start the continer run `./docker-start.sh`
    * ~~Be aware full repository initialization at the first run (particularly external vocabularies import) may take a lot of time. Anyway once `# Running 40-updateVocabularies.php` initialization stage is reached you may safely start using the repository without further waiting.~~
    * This repo ships with a database dump to skip avoid initial download of external vocabulaires
    * To stop the container run `docker container stop acdh-repo`
* To remove all data run `./reset-repo.sh`
* To remove everything just delete the current folder


## enter a running container

`docker exec -it -u www-data acdh-repo bash`

### check initscript logs

* inside the container (see above), look around `ls`
* to inspect initscript logs run `tail -f log/initScripts.log`

## the GUI
you should mainly focus on ARCHEs API, but you can find the ARCHE-GUI at http://localhost/browser/


## local PHP setup

* either install all needed things; see information about the needed PHP setup to run ingestions and file checks can be found [here](https://github.com/acdh-oeaw/arche-ingest?tab=readme-ov-file#installation--usage)

* or user docker

## how to test

* change into `testing` folder `cd testing` 

### ingest metadata

#### composer setup
* run `./metadata_ingest.sh` to ingest the ["Die eierlegende Wollmilchsau"](https://github.com/acdh-oeaw/arche-ingest/blob/master/sample.ttl)
* see [arche-ingest](https://github.com/acdh-oeaw/arche-ingest) for some documentation

#### docker setup

* first create and enter a php/arche container by running `./enter_php_container.sh`
* now you should be inside the container and the current working directory should be mounted into `data`, so if you change directory in data (`cd data`) and type `ls` you should see the files from the host `testing` folder
* run `./metadata_ingest.sh`

### run filechecker
 * run `./filechecker.sh`
 * check the results in `testing/fc_out/{datetime-of-last-run}` (e.g. cd into the directory, start python dev server `python -m http.server` and open the printed URL)
 * spoileralert: 2/3 files did not pass the test!

### ingest binaries
* (well you actually shouldn't do that, because they didn't pass the filechecker)
* run `./binaries_import.sh`
* see [repo-file-checker](https://github.com/acdh-oeaw/repo-file-checker) for some documentation

