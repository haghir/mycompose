#!/bin/bash

if [[ "x$1" == "x" ]] ; then
	echo "An argument to indicate the service name is required." 1>&2
	exit 1
fi

docker stack deploy --compose-file docker-compose.yml "$1"
