FROM php:8.0.10-apache

WORKDIR /var/www/html

ARG APP_HOST

# Install tools
RUN apt-get update -y \
 && apt-get upgrade -y \
 && apt-get install -y \
    apt-utils \
    nano \
    wget \
    dialog \
    mc \
    git \
    zip \
    unzip \
    mariadb-client \
    curl

# Install libraries
RUN apt-get install -y \
    # curl
    libcurl4-openssl-dev \
    # gd
    libpng-dev \
    # intl
    libicu-dev \
    # zip
    libzip-dev \
    # pdo_sqlite
    libsqlite3-dev \
    libsqlite3-0

# Install PHP Extensions
RUN docker-php-ext-install -j$(nproc) \
    bcmath \
    curl \
    gd \
    intl \
    mysqli \
    opcache \
    pdo_mysql \
    pdo_sqlite \
    tokenizer \
    zip

# Xdebug
RUN yes | pecl install xdebug \
 && docker-php-ext-enable xdebug

# Configuration file xdebug
COPY ./docker/webserver/xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Configuration file opcache
COPY ./docker/webserver/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

# Configuration file PHP
COPY ./docker/webserver/php.ini /usr/local/etc/php/php.ini

# Apache
COPY ./docker/webserver/host.conf /etc/apache2/sites-available/host.conf
RUN sed -i "s/hostnameexample/$APP_HOST/g" /etc/apache2/sites-available/host.conf \
 && a2enmod rewrite headers \
 && a2dissite 000-default \
 && a2ensite host

# PHPUnit
RUN wget https://phar.phpunit.de/phpunit.phar \
 && chmod +x phpunit.phar \
 && mv phpunit.phar /usr/local/bin/phpunit

# Composer
RUN curl -sS https://getcomposer.org/installer | php \
 && mv composer.phar /usr/local/bin/composer \
 && chmod +x /usr/local/bin/composer \
 && composer self-update --preview

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh \
 && bash nodesource_setup.sh \
 && apt-get install nodejs -y

# Wordpress WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
 && php wp-cli.phar --info \
 && chmod +x wp-cli.phar \
 && mv wp-cli.phar /usr/local/bin/wp

EXPOSE 80
