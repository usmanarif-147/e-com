# Use official PHP image
# PHP 8.3 CLI is enough for learning Laravel
FROM php:8.3-cli

# -----------------------------
# Install Linux packages
# -----------------------------
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    zip \
    libzip-dev \
    default-mysql-client

# -----------------------------
# Install PHP extensions
# Required by Laravel
# -----------------------------
RUN docker-php-ext-install \
    pdo \
    pdo_mysql \
    zip

# -----------------------------
# Install Composer
# So we don't need Composer
# on host machine
# -----------------------------
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# -----------------------------
# Set working directory
# All commands run here
# -----------------------------
WORKDIR /var/www

# -----------------------------
# Copy entrypoint script
# -----------------------------
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# -----------------------------
# Give execute permission
# -----------------------------
RUN chmod +x /usr/local/bin/entrypoint.sh

# -----------------------------
# Container startup command
# -----------------------------
ENTRYPOINT ["entrypoint.sh"]

# Keep container alive
CMD ["bash"]