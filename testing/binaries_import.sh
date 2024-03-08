#/bin/bash

composer require -W acdh-oeaw/arche-ingest:^1.4.6

echo "ingesting binaries"
vendor/bin/arche-import-binary to_ingest https://id.acdh.oeaw.ac.at/wollmilchsau http://127.0.0.1/api username password --skip not_exist
