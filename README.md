# arche-localhost-utils

A bunch of shell scripts to ease working with arche locally

## how to

* Clone the repo
* One time: run `./init-repo.sh` to create needed directories 
* To (re)start the continer run `./docker-start.sh`
    * Be aware full repository initialization at the first run (particularly external vocabularies import) may take a lot of time. Anyway once `# Running 40-updateVocabularies.php` initialization stage is reached you may safely start using the repository without further waiting.
    * To stop the container run `docker stop acdh-repo`
    * To obtain the repository config (e.g. for running imports) use `curl http://127.0.0.1/api/describe > config.ini`.  
        * If you edit `pathBase` and `urlBase` in the config by hand, remember they have to **exactly** match the repository URL (especially `http://127.0.0.1` doesn't exactly match `http://localhost`).
* To remove all data run `./reset-repo.sh`


## enter a running container

`docker exec -ti -u www-data acdh-repo bash`
