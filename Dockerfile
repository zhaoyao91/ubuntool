FROM ubuntu

RUN apt-get update -y

RUN apt-get install -y \
  iputils-ping \
  curl \
  wget \
  telnet \
  htop \
  vim \
  nano \
  dnsutils

# install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# install node.js
RUN /bin/bash -c 'source $HOME/.nvm/nvm.sh; nvm install v10'

# install global node.js tools
RUN /bin/bash -c 'source $HOME/.nvm/nvm.sh; npm install -g \
  fx \
'
