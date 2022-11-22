#!/bin/bash

clear

rm -rf .git

docker-compose up -d

curl -o https://wordpress.org/latest.zip
unzip latest.zip
mv wordpress public
rm latest.zip

docker-compose exec php-fpm chown -R www-data:www-data /application/public

sudo chmod -R 777 public/

git clone git@github.com:thimarsola/theme.git public/wp-content/themes/theme

cd public/wp-content/themes/theme

sh start.sh
