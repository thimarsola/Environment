#!/bin/sh
rm -rf .git
docker-compose up -d;
curl -O https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    mv wordpress public && \
    rm latest.zip;
docker-compose exec php-fpm chown -R www-data:www-data /application/public;
sudo chmod -R 777 public/
cd public/wp-content/themes;
git clone git@github.com:thimarsola/theme.git;
cd theme;
sh start.sh
