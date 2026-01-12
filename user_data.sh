#!/bin/bash
set -e

apt update -y
apt install -y apache2 php php-mysql mysql-client wget unzip

systemctl start apache2
systemctl enable apache2

cd /var/www/html
rm -f index.html

wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* /var/www/html/

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html