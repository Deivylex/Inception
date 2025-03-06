FROM alpine:3.20.6

# Create user nginx and add to primary and secondary group nginx (create if it doesn't exist)
RUN addgroup -S nginx && \
	adduser -S -G nginx -g nginx nginx

RUN apk update && apk add --no-cache \
	php82 \
	php82-phar \
	php82-curl \
	php82-fpm \
	php82-mysqli \
	php82-mbstring \
	php82-json \
	php82-gd \
	php82-xml \
	php82-zip \
	mariadb-client

# Listening port
EXPOSE 9000

# Create a symlink for `php`
RUN ln -s /usr/bin/php82 /usr/bin/php

# Create and copy paths and confs to cont
RUN mkdir -p /run/php/ /var/www/html

COPY conf/www.conf /etc/php82/php-fpm.d/www.conf

COPY ./tools/script.sh /
RUN chmod +x script.sh

ENTRYPOINT ["sh", "/script.sh"]
