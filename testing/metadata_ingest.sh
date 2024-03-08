#/bin/bash

composer require -W acdh-oeaw/arche-ingest:^1.4.6
vendor/bin/arche-import-metadata https://raw.githubusercontent.com/acdh-oeaw/arche-ingest/master/sample.ttl http://127.0.0.1/api username password

rm -rf vendor/
rm composer.*
# vendor/bin/arche-delete-resource https://id.acdh.oeaw.ac.at/wollmilchsau http://127.0.0.1/api username password --recursively
