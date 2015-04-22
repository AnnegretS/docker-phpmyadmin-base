FROM tutum/apache-php

RUN apt-get update && apt-get install -y wget mysql-client

# setup apache configuration
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite 

# setup phpmyadmin dir
RUN mkdir -p /phpmyadmin && \
    rm -rf /var/www/html && ln -s /phpmyadmin /var/www/html

# copy executables
COPY ./install-pma.sh /install-pma.sh
COPY ./wait-mysql.sh /wait-mysql.sh
RUN chmod a+x /install-pma.sh /wait-mysql.sh


RUN sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 100M/g" /etc/php5/apache2/php.ini

ENV DBHOST db
ENV DBUSER admin
ENV DBPASS 123456

ONBUILD COPY config.inc.php /config.inc.php