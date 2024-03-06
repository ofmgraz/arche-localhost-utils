# arche-localhost-utils

A bunch of shell scripts to ease working with arche locally

## how to install

* Clone the repo
* One time: run `./init-repo.sh` to create needed directories 
* To (re)start the continer run `./docker-start.sh`
    * ~~Be aware full repository initialization at the first run (particularly external vocabularies import) may take a lot of time. Anyway once `# Running 40-updateVocabularies.php` initialization stage is reached you may safely start using the repository without further waiting.~~
    * This repo ships with a database dump to skip avoid initial download of external vocabulaires
    * To stop the container run `docker container stop acdh-repo`
* To remove all data run `./reset-repo.sh`


## how to test

* change into `testing` folder `cd testing` 
* run `./ingest_test.sh` to ingest the ["Die eierlegende Wollmilchsau"](https://github.com/acdh-oeaw/arche-ingest/blob/master/sample.ttl)


## enter a running container

`docker exec -it -u www-data acdh-repo bash`


## local PHP setup

information about the needed PHP setup to run ingestions and file checks can be found [here](https://github.com/acdh-oeaw/arche-ingest?tab=readme-ov-file#installation--usage)
