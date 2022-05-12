#!/bin/bash

exit 1

curl "https://hub.docker.com/v2/repositories/$REPO/$IMAGE/tags/$TAG/" \
	-X DELETE \
	-H 'Authorization: Bearer [KEY]' \
  -H 'Accept: application/json' \
	-H 'Content-Type: application/json'
