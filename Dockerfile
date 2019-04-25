FROM tobivisioninc/atom:0.3.0

MAINTAINER tobivisioninc

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y net-tools

# Apache2
ENV APACHE_LOG_DIR /var/www/atom/var/logs
CMD chown -R www-data:www-data /var/www && /etc/init.d/apache2 start && \
	chown -R mysql:mysql /var/lib/mysql && mysqld_safe