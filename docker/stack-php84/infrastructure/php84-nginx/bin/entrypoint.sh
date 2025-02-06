#!/bin/bash

/usr/bin/laravel.sh

php-fpm -D -y /usr/local/etc/php-fpm.d/php-fpm.conf
nginx -g "daemon off;"