#!/bin/bash

# Source external creds/libs
source config/elastic.sh
source config/aws.sh
source include/func.sh

# Params for setup:
#  $1 - Expected CLI argument count
#  $2 - Error message describing correct usage
setup 1 ""

# Execute the call to AWS.
echo "*** $ENVIRONMENT ***"
aws-es-curl -X GET https://${ES_URI}/_cat/indices?pretty
