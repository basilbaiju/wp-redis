FROM wordpress:latest
RUN apt-get update && apt-get install -y \
    libzip-dev \
    && docker-php-ext-install zip
RUN pecl install redis \
    && docker-php-ext-enable redis
RUN chown -R www-data:www-data /var/www/html
EXPOSE 80
