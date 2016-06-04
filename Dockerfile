FROM alpine:3.4
MAINTAINER Harry Walter
MAINTAINER Andy Postnikov <andypost@ya.ru>

RUN apk add --no-cache php5 php5-xml php5-dom php5-pdo_mysql \
    php5-mcrypt php5-curl php5-json php5-phar php5-openssl \
    php5-gd php5-opcache php5-ctype php5-zlib \
    php5-bcmath php5-apcu patch curl \
    && rm -fr /var/cache/apk/* \
    && curl -sS https://getcomposer.org/installer | php -- --filename=composer \
    --install-dir=/usr/bin --version=1.1.2 \
    && curl -sS "http://files.drush.org/drush.phar" -o /usr/bin/drush && chmod +x /usr/bin/drush

COPY php.ini /etc/php5/conf.d/xx-drupal.ini

# Add frontend tools
# @todo add php5-xdebug for dev boxes in runtime
RUN apk add --no-cache mariadb-client nodejs make g++ python

RUN npm install -g gulp && \
  apk add --no-cache make g++ python && \
  npm install -g node-sass

WORKDIR /srv

EXPOSE 80

CMD php -t /srv -S 0.0.0.0:80
