FROM alpine:3.3
MAINTAINER Harry Walter
MAINTAINER Andy Postnikov <andypost@ya.ru>

RUN apk add --no-cache php php-xml php-dom php-pdo_mysql \
    php-mcrypt php-curl php-json php-phar php-openssl \
    php-gd php-opcache php-ctype php-zlib \
    php-bcmath php-apcu patch curl \
    && rm -fr /var/cache/apk/* \
    && curl -sS https://getcomposer.org/installer | php -- --filename=composer \
    --install-dir=/usr/bin --version=1.1.0 \
    && curl -sS "http://files.drush.org/drush.phar" -o /usr/bin/drush && chmod +x /usr/bin/drush

COPY php.ini /etc/php7/conf.d/xx-drupal.ini

# Add frontend tools
# todo add php-xdebug xdebug
RUN apk add --no-cache mysql-client nodejs make g++ python

RUN npm install -g gulp && \
  apk add --no-cache make g++ python && \
  npm install -g node-sass

WORKDIR /srv

EXPOSE 80

CMD php -t /srv -S 0.0.0.0:80
