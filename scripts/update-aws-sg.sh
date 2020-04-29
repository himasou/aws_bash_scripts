#!/bin/bash

set -e
if [[ $# -eq 0 ]] ; then
    echo 'WHOA Hold your horses, you need to provide the sg ID, from port and to port and region e.g ./update-aws-sg.sh sg-12345 22 22 us-east-1'
    exit 1
fi

SG=$1
FROMPORT=$2
TOPORT=$3
export AWS_DEFAULT_REGION=$4
export AWS_REGION=$4

aws ec2 authorize-security-group-ingress --group-id $SG --ip-permissions IpProtocol=tcp,FromPort=$FROMPORT,ToPort=$TOPORT,IpRanges='{CidrIp=1.2.3.4/5,Description="Loction1"}]' || : &&
aws ec2 authorize-security-group-ingress --group-id $SG --ip-permissions IpProtocol=tcp,FromPort=$FROMPORT,ToPort=$TOPORT,IpRanges='[{CidrIp=6.7.8.9/5,Description="Location2"}]' || : &&
#remove access from 0.0.0.0/0
aws ec2 revoke-security-group-ingress --group-id $SG --protocol tcp --port $FROMPORT --cidr 0.0.0.0/0 || : &&
echo "AWS Subnets Updated for $SG"



