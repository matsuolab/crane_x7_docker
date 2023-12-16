#!/bin/bash

################################################################################

if [ ! -z $CRANEX_PROJECT_NAME ]; then
  PROJECT=$CRANEX_PROJECT_NAME
elif [ ! -z $1 ]; then
  PROJECT=$1
else 
  echo "Set CRANEX_PROJECT_NAME (e.g. 'export CRANEX_PROJECT_NAME=mytest')"
  exit 1
fi

CONTAINER="${PROJECT}_cranex_ros_1"
echo "$0: PROJECT=${PROJECT}"
echo "$0: CONTAINER=${CONTAINER}"

# Stop and remove the Docker container.
EXISTING_CONTAINER_ID=`docker ps -aq -f name=${CONTAINER}`
if [ ! -z "${EXISTING_CONTAINER_ID}" ]; then
  echo "The container name ${CONTAINER} is already in use" 1>&2
  echo ${EXISTING_CONTAINER_ID}
  exit 1
fi

################################################################################

# Build the Docker image with the Nvidia GL library.
echo "starting build"
docker-compose -p ${PROJECT} -f ./docker/docker-compose.yml build