Python and Pycharm
==================

The run.sh builds a docker container which is prepared to run an external installation of pycharm. If all variables are correct, pycharm open its window in your X11.

Assumptions
-----------
The user in the container has a uid of 1000 and gid of 1000 and is named "user". If this is not true for your user, fix this in the Dockerfile. If you would like to change the username in the container, fix this in run.sh and the Dockerfile.

Inspired by
-----------
https://nelkinda.com/blog/xeyes-in-docker/
https://github.com/mviereck/x11docker/blob/master/x11docker

