#!/bin/sh

cd /

wget  -O /pma.tar.gz $1

PMA_DIR=$(tar -tzf /pma.tar.gz | head -n 1)
echo $PMA_DIR
tar -xzf /pma.tar.gz

rmdir /phpmyadmin
mv /$PMA_DIR /phpmyadmin

mv /config.inc.php /phpmyadmin/config.inc.php

chown -R www-data.www-data /phpmyadmin

rm /pma.tar.gz
