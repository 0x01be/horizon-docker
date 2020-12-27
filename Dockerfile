FROM 0x01be/horizon:build as build

FROM 0x01be/xpra

COPY --from=build /horizon/build/horizon-* /opt/horizon/bin/

RUN apk add --no-cache --virtual horizon-runtime-dependencies \
    util-linux \
    gtkmm3 \
    cairomm \
    librsvg \
    yaml-cpp \
    sqlite \
    boost \
    zeromq \
    glm \
    libgit2 \
    curl \
    podofo \
    libzip \
    mesa-dri-swrast &&\
    apk add --no-cache --virtual horizon-edge-runtime-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    opencascade \
    cppzmq

USER ${USER}
ENV PATH=${PATH}:/opt/horizon/bin \
    COMMAND=horizon-eda

