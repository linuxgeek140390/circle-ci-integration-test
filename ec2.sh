#!/bin/bash
echo "We are going to create an ec2 instance ...."
region="us-west-2"
echo "Install aws cli ..."
apt install awscli
aws --version



full_ref="$GITHUB_REF"
branch_name=${full_ref##*/}
echo "We are on branch $branch_name"
env="$branch_name"
echo "This execution will create ec2 instance for $env environment"
aws ec2 run-instances --image-id ami-0b2b4f610e654d9ac --count 1 --instance-type t2.micro --key-name circleci --security-group-ids sg-0fe321f40b7431450 --subnet-id subnet-09e865d82bb0c018d --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value={$env}}]' --region us-west-2





