FROM php:5.6-fpm
# install composer
RUN cd /usr/bin && curl -s http://getcomposer.org/installer | php && ln -s /usr/bin/composer.phar /usr/bin/composer

RUN apt-get update \
    && apt-get install -y \
    git \
    zip \
    unzip \
    vim

RUN apt-get update \
    && apt-get install -y libpq-dev libicu-dev \
    && docker-php-ext-install pdo_mysql pdo_pgsql intl
WORKDIR /var/www/html