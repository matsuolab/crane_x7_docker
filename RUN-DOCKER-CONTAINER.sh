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

# Run the Docker container in the background.
# Any changes made to './docker/docker-compose.yml' will recreate and overwrite the container.
docker-compose -p ${PROJECT} -f ./docker/docker-compose.yml up -d

if [ ! -z $DISPLAY ]; then
  XAUTH_RESULT="$(xauth list $DISPLAY)"
  if [ -z "$XAUTH_RESULT" ]; then
    xauth generate $DISPLAY .
  fi
  XAUTH_RESULT=($(xauth list $DISPLAY))
  docker exec -it $CONTAINER bash -c "touch /root/.Xauthority; xauth add $DISPLAY ${XAUTH_RESULT[1]} ${XAUTH_RESULT[2]}"
fi

# Enter the Docker container with a Bash shell (with or without a custom 'roslaunch' command).
case "$2" in
  ( "" )
  docker exec -i -t ${CONTAINER} bash
  ;;
  ( * )
  echo "Failed to enter the Docker container '${CONTAINER}': '$2' is not a valid argument value."
  ;;
esac
