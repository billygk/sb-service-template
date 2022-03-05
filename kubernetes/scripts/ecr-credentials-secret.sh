#!/bin/bash

# This script is intended to update a k8s secret used for accessing ECR private registry. Used to pull private images.

# Prerequisits:
#   - running kubectl to update secret

# SECURITY WARNING: aws credential values should come from env variables, vault or some other method, to avoid credentials been stored in git repositories.

# aws credentials will be read from .aws/credentials

# url example: 348579843811.dkr.ecr.us-east-2.amazonaws.com/te-hub-config-service
# aws account id
ACCOUNT=348579843811
# aws region we will be working on
REGION=us-east-2
# k8s secret name
SECRET_NAME=ecr-registry
# Email
EMAIL=gkrepper@tenantevaluation.com
# Token from aws ecr  
## old TOKEN=`aws ecr get-login --region ${REGION} --registry-ids ${ACCOUNT} | cut -d' ' -f6`
TOKEN=`aws ecr get-login-password --region ${REGION}`

echo "Deleting k8s secret for ecr"
kubectl delete secrets --ignore-not-found $SECRET_NAME

echo "Creating new k8s secret for ecr"

kubectl create secret docker-registry $SECRET_NAME --docker-server=https://${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com --docker-username=AWS --docker-password="${TOKEN}" --docker-email="${EMAIL}"

