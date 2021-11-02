FROM dorowu/ubuntu-desktop-lxde-vnc

RUN apt-get remove -yy firefox \
    && apt-get update \
    && apt-get install -yy wget \
    && apt autoclean -y \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*
# random version 50
ARG FIREFOX_VERSION=50.0
ENV FIREFOX_PATH=/firefox/$FIREFOX_VERSION
# remote url
ENV FIREFOX_URL=http://releases.mozilla.org/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-US/firefox-$FIREFOX_VERSION.tar.bz2
RUN mkdir -p $FIREFOX_PATH
# fetch it and uncompress to destination
RUN wget -qO- $FIREFOX_URL | tar xvj --strip 1 -C $FIREFOX_PATH/
# create visible link in desktop
RUN mkdir /root/Desktop
RUN ln -s /firefox/$FIREFOX_VERSION/firefox /root/Desktop/firefox

CMD $FIREFOX_PATH/firefox
