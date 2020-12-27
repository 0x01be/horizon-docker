FROM 0x01be/base

WORKDIR /horizon
ENV REVISION=master
RUN apk add --no-cache --virtual horizon-build-dependencies \
    git \
    build-base \
    util-linux \
    binutils-gold \
    gtkmm3-dev \
    cairomm-dev \
    librsvg-dev \
    yaml-cpp-dev \
    sqlite-dev \
    boost-dev \
    zeromq-dev \
    glm-dev \
    libgit2-dev \
    curl-dev \
    podofo-dev \
    libzip-dev &&\
    apk add --no-cache --virtual horizon-edge-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    opencascade-dev \
    cppzmq &&\
    git clone --depth 1 --branch ${REVISION} https://github.com/horizon-eda/horizon.git /horizon &&\
    make

