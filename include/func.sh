#!/bin/bash

# Get the main env variables
export ARG_COUNT=$#
export ENVIRONMENT=$1
export MAIN_INDEX=$2
shift 2
export OTHER_INDICES=$@

# Params:
#  $1 - Expected CLI argument count
#  $2 - Error message describing correct usage
function setup ()
{
  if [ $ARG_COUNT -lt $1 ]
  then
    echo "USAGE -- $0 <env> $2"
    exit
  fi

  awssetenv $ENVIRONMENT
}


function awssetenv ()
{
  if [ $1 = "production" ]
  then
    export ENVIRONMENT="PRODUCTION"
    export ES_URI=$ES_PROD_URI
  else
    export ENVIRONMENT="STAGING"
    export ES_URI=$ES_STAGE_URI
  fi
}
