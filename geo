#!/usr/bin/env bash

set -e

DOCKER_IMAGE=sparkgeo/geodocker:latest
CONTAINER_NAME="geo-$$"

# Trap SIGINT (Ctrl+C) to stop the container
cleanup() {
	echo "\nCaught Ctrl+C, stopping container $CONTAINER_NAME..."
	docker kill "$CONTAINER_NAME" 2>/dev/null || true
	exit 130
}
trap cleanup SIGINT

docker run --rm --name "$CONTAINER_NAME" \
	-v $(pwd):/working \
    -w /working \
	$DOCKER_IMAGE \
	"$@"
