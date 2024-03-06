#/bin/bash

composer require "acdh-oeaw/arche-ingest:^1"
# vendor/bin/arche-import-metadata https://raw.githubusercontent.com/acdh-oeaw/arche-ingest/master/sample.ttl http://127.0.0.1/api username password

vendor/bin/arche-delete-resource https://id.acdh.oeaw.ac.at/wollmilchsau http://127.0.0.1/api username password --recursively