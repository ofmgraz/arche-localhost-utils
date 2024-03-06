#/bin/bash

composer require "acdh-oeaw/arche-ingest:^1"

echo "ingesting 
vendor/bin/arche-import-binary to_ingest https://id.acdh.oeaw.ac.at/wollmilchsau http://127.0.0.1/api username password --skip not_exist
