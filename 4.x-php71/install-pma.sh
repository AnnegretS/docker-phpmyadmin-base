#!/bin/sh

#stop on error
set -e

cd /

wget  -O /pma.tar.gz https://files.phpmyadmin.net/phpMyAdmin/$PMA_VERSION/phpMyAdmin-$PMA_VERSION-all-languages.tar.gz

PMA_DIR=$(tar -tzf /pma.tar.gz | head -n 1)
echo $PMA_DIR
tar -xzf /pma.tar.gz

rmdir /phpmyadmin
mv /$PMA_DIR /phpmyadmin

mv /config.inc.php /phpmyadmin/config.inc.php

chown -R www-data.www-data /phpmyadmin

rm /pma.tar.gz
