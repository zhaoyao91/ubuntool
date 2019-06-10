FROM docker:18.09 as docker

FROM ubuntu:18.04

# setup variables

ENV UBUNTOOL_NODE_VERSION "12.x"

ENV UBUNTOOL_COMMON_TOOLS "\
    iputils-ping \
    curl \
    wget \
    telnet \
    htop \
    vim \
    nano \
    dnsutils \
"

ENV UBUNTOOL_NODE_GLOBAL_PACAKGES "\
    shelljs \
    shx \
    fx \
"

ENV NODE_PATH "/usr/lib/node_modules"

# execute setup process

# install docker client
COPY --from=docker /usr/local/bin/docker /usr/local/bin/

# setup others
RUN apt-get update -y && \
    # install common tools
    apt-get install -y $UBUNTOOL_COMMON_TOOLS && \
    # install nodejs
    curl -sL https://deb.nodesource.com/setup_$UBUNTOOL_NODE_VERSION | bash - && \
    apt-get install -y nodejs && \
    # install nodejs global packages
    npm install -g $UBUNTOOL_NODE_GLOBAL_PACAKGES && \
    # clean up
    npm cache clean --force && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    # end
    echo "setup finished"
