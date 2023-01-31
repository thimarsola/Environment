#!/bin/bash
docker-compose up -d;
mkdir public
docker-compose exec php-fpm chown -R www-data:www-data /application/public;
sudo chmod -R 777 public/
