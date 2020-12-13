#!/usr/bin/env sh

echo "securitygourps.sh1"
go get -u github.com/jvehent/pineapple
echo "securitygourps.sh2"
$GOPATH/bin/pineapple -c /app/deploymentTests/SG.yaml

echo "securitygourps.sh2"
