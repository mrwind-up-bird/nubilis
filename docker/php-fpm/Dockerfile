FROM php:8.3-fpm
WORKDIR /application

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& apt-get update \
&& apt-get install -y mariadb-client \
&& apt-get install -y libicu-dev \
&& pecl install redis && docker-php-ext-enable redis \
&& pecl install xdebug && docker-php-ext-enable xdebug \
&& docker-php-ext-configure intl \
&& docker-php-ext-install pdo pdo_mysql mysqli intl \
