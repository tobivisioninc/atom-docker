FROM tobivisioninc/atom:0.2.5

MAINTAINER tobivisioninc

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y net-tools

# Apache2
ENV APACHE_LOG_DIR /var/www/atom/var/logs
CMD chown -R www-data:www-data /var/www/atom/var && \
	chown -R mysql:mysql /var/lib/mysql && \
	/etc/init.d/apache2 start && /etc/init.d/mysql start && \
	tail -f /var/www/atom/var/logs/*
