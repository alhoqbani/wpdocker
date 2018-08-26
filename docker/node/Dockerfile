FROM node:latest

LABEL maintainer="Hamoud Alhoqbani"

WORKDIR /var/www/html

ARG uid=999

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb http://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main" > /etc/apt/sources.list.d/ppa_ondrej_php.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C \
    && apt-get update \
    && apt-get install -y git yarn ruby-dev ruby-sass php7.2-cli php7.2-xml\
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && gem install sass


RUN usermod -u $uid node
