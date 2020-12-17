#!/usr/bin/env sh

go get -u github.com/jvehent/pineapple
ls -al $GOPATH/bin/
$GOPATH/bin/pineapple -c /app/SG.yaml
