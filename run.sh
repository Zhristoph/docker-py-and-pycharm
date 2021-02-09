#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

DockerFrom="python"
DockerTo="py-and-pycharm"
DockerTag="3.9.1-buster"
DockerFromTagged="${DockerFrom}:${DockerTag}"
DockerToTagged="${DockerTo}:${DockerTag}"

#Where is my .Xauthority file outside of the container?
DirUser="/home/user"
#Where should persistent data from the container be saved?
#Will be mounted as home dir
DirProject="/home/user/tmp"
#Where ist the installation of pycharm?
DirPycharm="/opt/pycharm-community-2020.3.3"

#Comment this to not build docker image at every start
docker build \
    --build-arg=DockerFrom="${DockerFromTagged}" \
    --tag "${DockerToTagged}" .

exec docker run \
    --interactive \
    --tty \
    --rm \
    --name "${DockerTo}" \
    --net=host \
    --env=DISPLAY \
    --volume="${DirProject}:/home/user" \
    --volume="${DirUser}/.Xauthority:/home/user/.Xauthority" \
    --volume="${DirPycharm}:/opt/pycharm" \
    --entrypoint="/opt/pycharm/bin/pycharm.sh" \
    "${DockerToTagged}"
