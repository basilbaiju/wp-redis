# Use the official WordPress image as the base
FROM wordpress:latest

# Install dependencies for Redis PHP extension
RUN apt-get update && apt-get install -y \
    libzip-dev \
    && docker-php-ext-install zip

# Install Redis extension using PECL
RUN pecl install redis \
    && docker-php-ext-enable redis

# Ensure proper ownership for WordPress files
RUN chown -R www-data:www-data /var/www/html

# Expose the WordPress default port
EXPOSE 80
