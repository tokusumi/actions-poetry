#!/bin/ash

set -e

IMAGE_NAME='poetry'

if [ "$(docker image ls -q ${IMAGE_NAME})" ]; then
    echo "Image ${IMAGE_NAME} already exist."
else
    cp /entrypoint.sh ./entrypoint.sh
    docker build -t ${IMAGE_NAME} \
            --build-arg INPUT_PYTHON_VERSION=${INPUT_PYTHON_VERSION} \
            --build-arg INPUT_POETRY_VERSION=${INPUT_POETRY_VERSION} \
            -f /Dockerfile-core ./
fi

docker run poetry ${INPUT_COMMAND}
