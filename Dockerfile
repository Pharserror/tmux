# A debian jessie docker container with Tmux and some core apps installed

FROM debian:buster
MAINTAINER Adam Lind <sunboxnet@gmail.com>

# Set correct environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Base Applications install
RUN apt update -y && apt -y install \
    curl \
    gnupg \
    tmux \
    openssh-server \
    lsb-release \
    apt-transport-https \
    procps && \
  curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
  echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && \
  apt update && apt install -y --no-install-recommends \
    docker-ce && \
  apt-get autoclean && \
  rm -rf /var/lib/apt/lists/* && \
  curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
  chmod +x /usr/local/bin/docker-compose


# Copy over the start file
COPY entrypoint.sh /entrypoint.sh

CMD ["./entrypoint.sh"]
