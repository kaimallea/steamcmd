FROM ubuntu:14.04

MAINTAINER Kai Mallea <kmallea@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update &&\
    apt-get install -y curl lib32gcc1

# Create steam user
RUN adduser \
        --disabled-login \
        --shell /bin/bash \
        --gecos "" \
        steam

# Run the rest of the commands as the steam user
USER steam

# Download and extract SteamCMD
RUN mkdir /home/steam/steamcmd &&\
    cd /home/steam/steamcmd &&\
    curl http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz

WORKDIR /home/steam/steamcmd

# This container will be executable
ENTRYPOINT ["./steamcmd.sh"]