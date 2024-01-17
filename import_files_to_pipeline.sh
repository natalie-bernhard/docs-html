#!/bin/bash

for fold in en/*; do
    for f in $fold/*.html; do
        fileid=""
        fileid+="$(basename "$f" .html)"
        fileid+="-"
        fileid+="$(basename "$fold")"
        java -Djavax.net.ssl.trustStore=.keystore -Djavax.net.ssl.trustStorePassword=openliberty \
        -jar gp-cli-2.4.0-SNAPSHOT-with-dependencies.jar create-file -j openliberty__credential.json \
        -f $fileid -t text/html -l en,ja,zh-Hans
        java -Djavax.net.ssl.trustStore=.keystore -Djavax.net.ssl.trustStorePassword=openliberty \
        -jar gp-cli-2.4.0-SNAPSHOT-with-dependencies.jar import-file -j openliberty__credential.json \
        -f $fileid -l en -F $f
    done
done