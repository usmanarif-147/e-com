#!/bin/bash

echo "Container Started"

# ------------------------------------------------
# Fix permissions
#
# Host machine edits files
# Container reads/writes files
#
# 1000 is usually first Linux user id
# Check using:
#
# id -u
#
# Change below if needed
# ------------------------------------------------


chown -R 1000:1000 /var/www

if [ ! -d vendor ]; then
    composer install
fi

if [ ! -f .env ]; then
    cp .env.example .env
    php artisan key:generate
fi

# Execute command passed to container
if [ -f /var/www/artisan ]; then
    php artisan serve --host=0.0.0.0 --port=8000
else
    exec "$@"
fi