FROM php:8.1.0-cli

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
    curl

# Install libraries
RUN apt-get install -y \
    # curl
    libcurl4-openssl-dev \
    # gd
    libpng-dev \
    # zip
    libzip-dev

# Install PHP Extensions
RUN docker-php-ext-install -j$(nproc) \
    curl \
    gd \
    zip

# Xdebug
RUN yes | pecl install xdebug \
 && docker-php-ext-enable xdebug

# Configuration file xdebug
COPY ./xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# PHPUnit
RUN wget https://phar.phpunit.de/phpunit.phar \
 && chmod +x phpunit.phar \
 && mv phpunit.phar /usr/local/bin/phpunit

# Composer
RUN curl -sS https://getcomposer.org/installer | php \
 && mv composer.phar /usr/local/bin/composer \
 && chmod +x /usr/local/bin/composer \
 && composer self-update --preview

WORKDIR /app