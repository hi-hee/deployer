#!/usr/bin/env sh

go get -u github.com/jvehent/pineapple
ls -al $GOPATH/bin/
$GOPATH/bin/pineapple <<EOF
aws:
    region: us-east-2
    accountnumber: 998267510686

components:
    - name: application
      type: ec2
      tag: 
          key: elasticbeanstalk:environment-name
          value: Invoicer02-env

    - name: database
      type: rds
      tag:
          key: environment-name
          value: Invoicer02-env

    - name: bastion
      type: ec2
      tag:
          key: environment-name
          value: invoicer-bastion

rules:
    - src: application
      dst: database
      dport: 5432

    - src: bastion
      dst: application
      dport: 22

    - src: bastion
      dst: database
      dport: 5432
EOF      
