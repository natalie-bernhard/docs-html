#!/bin/bash

mkdir ja
mkdir zh-Hans
for fold in en/*; do
    mkdir ja/$(basename "$fold")
    mkdir zh-Hans/$(basename "$fold")
    for f in $fold/*.html; do
        savename="$(basename "$f" .html)"
        fileid=""
        fileid+=$savename
        fileid+="-"
        fileid+="$(basename "$fold")"
        # set up for multiple versions
        java -Djavax.net.ssl.trustStore=.keystore -Djavax.net.ssl.trustStorePassword=openliberty \
        -jar gp-cli-2.4.0-SNAPSHOT-with-dependencies.jar export-file -j openliberty__credential.json \
        -f $fileid -l ja -F "ja/$(basename "$fold")/$savename.html"
        java -Djavax.net.ssl.trustStore=.keystore -Djavax.net.ssl.trustStorePassword=openliberty \
        -jar gp-cli-2.4.0-SNAPSHOT-with-dependencies.jar export-file -j openliberty__credential.json \
        -f $fileid -l zh-Hans -F "zh-Hans/$(basename "$fold")/$savename.html"
    done
done