#!/usr/bin/env sh

go get -u github.com/jvehent/pineapple
$GOPATH/bin/pineapple -c /app/deploymentTests/SG.yaml
