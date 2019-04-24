FROM tobivisioninc/atom:latest

MAINTAINER tobivisioninc

# Apache2
ENV APACHE_LOG_DIR /var/www/atom/var/logs

CMD /etc/init.d/apache2 restart

CMD apachectl -D FOREGROUND

# MySQL
ENV MYSQL_USER=root \
    MYSQL_VERSION=5.7.25 \
    MYSQL_DATA_DIR=/var/lib/mysql \
    MYSQL_RUN_DIR=/run/mysqld \
    MYSQL_LOG_DIR=/var/log/mysql

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server=${MYSQL_VERSION}* \
 && rm -rf ${MYSQL_DATA_DIR} \
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh

RUN chmod 755 /sbin/entrypoint.sh

#EXPOSE 3306/tcp

ENTRYPOINT ["/sbin/entrypoint.sh"]

#RUN mysql -u root -e "CREATE DATABASE atom;"
#RUN mysql -u root -e "CREATE USER 'atom'@'localhost' IDENTIFIED BY 'atom';"
#RUN mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'atom'@'localhost';"
#RUN mysql -u root -e "FLUSH PRIVILEGES";

#RUN /var/www/atom/bin/console.py schema create
