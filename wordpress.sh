#!/bin/bash
docker-compose up -d
mkdir public
wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
mv wordpress/* public
rm -rf ./wordpress/
rm -rf latest.tar.gz
docker-compose exec php-fpm chown -R www-data:www-data /application/public
sudo chmod -R 777 public/
git clone git@github.com:thimarsola/theme.git public/wp-content/themes/theme;
