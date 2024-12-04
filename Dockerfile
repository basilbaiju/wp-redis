FROM wordpress:latest
RUN docker-php-ext-install redis \
    && docker-php-ext-enable redis
COPY wp-config.php /var/www/html/wp-config.php
RUN chown -R www-data:www-data /var/www/html
