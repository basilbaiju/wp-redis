# Use the official WordPress image as the base
FROM wordpress:latest

# Install the Redis PHP extension
RUN docker-php-ext-install redis && docker-php-ext-enable redis

# Ensure proper ownership for WordPress files
RUN chown -R www-data:www-data /var/www/html

# Expose the WordPress default port
EXPOSE 80
