FROM debian:latest

RUN apt update
RUN apt install -y wget bzip2 libgtk-3-dev libasound2 libdbus-glib-1-dev
WORKDIR /tmp
COPY firefox-*.tar.bz2 firefox.tar.bz2

RUN tar xjf firefox.tar.bz2
RUN mv firefox /opt/
RUN ln -s /opt/firefox/firefox /usr/local/bin/firefox
RUN wget https://raw.githubusercontent.com/mozilla/sumo-kb/main/install-firefox-linux/firefox.desktop -P /usr/local/share/applications
