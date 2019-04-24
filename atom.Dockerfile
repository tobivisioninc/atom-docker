FROM tobivisioninc/atom:latest

MAINTAINER tobivisioninc

#CMD /usr/bin/mysqld_safe

#CMD chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
#CMD /etc/init.d/mysql restart

ENV APACHE_LOG_DIR /var/log/apache2

CMD /etc/init.d/apache2 restart

CMD apachectl -D FOREGROUND

RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
ENV MYSQL_USER root
RUN /etc/init.d/mysql start

#RUN apt-get update \
# && DEBIAN_FRONTEND=noninteractive apt-get remove --purge -y mysql-server \
# && DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server \
# && sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mysql.conf.d/mysqld.cnf \
#RUN chown -R mysql:mysql /var/run/mysqld \
# && /bin/sh /usr/bin/mysqld_safe &
 

#RUN mysql -u root -e "CREATE DATABASE atom;"
#RUN mysql -u root -e "CREATE USER 'atom'@'localhost' IDENTIFIED BY 'atom';"
#RUN mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'atom'@'localhost';"
#RUN mysql -u root -e "FLUSH PRIVILEGES";

#zRUN /var/www/atom/bin/console.py schema create
