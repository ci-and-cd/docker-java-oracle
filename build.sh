#!/usr/bin/env bash

set -e

docker version
docker-compose version

WORK_DIR=$(pwd)

if [ -n "${CI_OPT_DOCKER_REGISTRY_PASS}" ] && [ -n "${CI_OPT_DOCKER_REGISTRY_USER}" ]; then echo ${CI_OPT_DOCKER_REGISTRY_PASS} | docker login --password-stdin -u="${CI_OPT_DOCKER_REGISTRY_USER}" docker.io; fi

sed "s#%IMAGE_ARG_ENCODING%#${IMAGE_ARG_ENCODING:-UTF-8}#g" Dockerfile_template | \
  sed "s#%IMAGE_ARG_GLIBC_VERSION%#${IMAGE_ARG_GLIBC_VERSION:-2.25-r0}#g" | \
  sed "s#%IMAGE_ARG_JAVA_VERSION%#${IMAGE_ARG_JAVA_VERSION:-9.0.4}#g" | \
  sed "s#%IMAGE_ARG_LOCALE%#${IMAGE_ARG_LOCALE:-en_US}#g" | \
  sed "s#%IMAGE_ARG_TZ_AREA%#${IMAGE_ARG_TZ_AREA:-Etc}#g" | \
  sed "s#%IMAGE_ARG_TZ_ZONE%#${IMAGE_ARG_TZ_ZONE:-UTC}#g" > Dockerfile

docker-compose build
docker-compose push
