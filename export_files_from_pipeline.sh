#!/bin/bash

for f in en/*.html; do
    FILE_ID="$(basename "$f" .html)"
    # touch ja/$fileid.html
    java -Djavax.net.ssl.trustStore=.keystore -Djavax.net.ssl.trustStorePassword=openliberty \
    -jar gp-cli-2.4.0-SNAPSHOT-with-dependencies.jar export-file -j openliberty__credential.json \
    -f $FILE_ID -l ja -F "ja/$FILE_ID.html"
done