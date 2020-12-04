#!/bin/bash
go get -u github.com/jvehent/pineapple
$GOPATH/bin/pineapple << 
aws:
    region: us-east-1
    accountnumber: 927034868273

components:
    - name: load-balancer
      type: elb
      tag:
          key: elasticbeanstalk:environment-name
          value: invoicer02-env

    - name: application
      type: ec2
      tag: 
          key: elasticbeanstalk:environment-name
          value: invoicer02-env

    - name: database
      type: rds
      tag:
          key: environment-name
          value: invoicer02-env

#    - name: bastion
#      type: ec2
#      tag:
#          key: environment-name
#          value: invoicer-bastion

rules:
    - src: 0.0.0.0/0
      dst: load-balancer
      dport: 443

    - src: load-balancer
      dst: application
      dport: 80

    - src: application
      dst: database
      dport: 5432

#    - src: bastion
#      dst: application
#      dport: 22
#
#    - src: bastion
#      dst: database
#      dport: 5432
EOF
