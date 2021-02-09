ARG DockerFrom=python:3.9.1-buster
FROM ${DockerFrom}

RUN apt-get update && apt-get install -y less libxtst6 neovim x11-apps
RUN rm -rf /tmp/* /usr/share/doc/* /usr/share/info/* /var/tmp/*
RUN groupadd --gid 1000 user
RUN useradd --uid 1000 --gid 1000 --create-home --shell /bin/bash user
ENV DISPLAY :0

USER user
ENTRYPOINT /usr/bin/tail -f /dev/null
