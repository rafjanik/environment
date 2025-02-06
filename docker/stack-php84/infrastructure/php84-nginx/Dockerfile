FROM php:8.4-fpm-alpine3.21

# Install tools
RUN apk add --no-cache \
    bash \
    curl \
    dialog \
    git \
    nano \
    nginx \
    supervisor \
    unzip \
    vim \
    wget \
    zip

# Install libraries
RUN apk add --no-cache \
    libzip-dev \
    freetype-dev \
    icu-dev \
    libmcrypt-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libxslt-dev \
    libzip-dev

# Install PHP Extensions
RUN apk add --no-cache \
    php84 \
    php84-cli \
    php84-ctype \
    php84-curl \
    php84-dom \
    php84-fileinfo \
    php84-fpm \
    php84-gd \
    php84-intl \
    php84-mbstring \
    php84-opcache \
    php84-openssl \
    php84-phar \
    php84-session \
    php84-tokenizer \
    php84-soap \
    php84-xml \
    php84-xmlreader \
    php84-xmlwriter \
    php84-simplexml \
    php84-zip \
    php84-pdo \
    php84-pdo_sqlite \
    php84-sqlite3 \
    php84-pdo_mysql \
    php84-mysqlnd \
    php84-mysqli \
    php84-pdo_pgsql \
    php84-pgsql \
    php84-mongodb \
    php84-redis

# PHP Docker
RUN docker-php-ext-install \
    bcmath \
    zip \
    opcache \
    intl \
    pdo_mysql

COPY --from=composer:2.8.3 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

COPY ./infrastructure/php84-nginx/configs/default.conf /etc/nginx/conf.d/default.conf
COPY ./infrastructure/php84-nginx/configs/nginx.conf /etc/nginx/nginx.conf
COPY ./infrastructure/php84-nginx/configs/php-fpm.conf /usr/local/etc/php-fpm.d/php-fpm.conf
COPY ./infrastructure/php84-nginx/configs/php.ini /usr/local/etc/php/php.ini
COPY ./infrastructure/php84-nginx/bin/* /usr/bin

EXPOSE 80 443

ENTRYPOINT ["/usr/bin/entrypoint.sh"]