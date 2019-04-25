FROM tobivisioninc/atom:latest

MAINTAINER tobivisioninc

# Apache2
ENV APACHE_LOG_DIR /var/www/atom/var/logs


COPY entrypoint.sh /sbin/entrypoint.sh

RUN chmod 755 /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh

EXPOSE 80/tcp

ENTRYPOINT ["/sbin/entrypoint.sh"]

#CMD chown -R www-data:www-data /var/www/atom/var && \
#	chown -R mysql:mysql /var/lib/mysql /etc/mysql && \
#	/etc/init.d/apache2 start && /etc/init.d/mysql start && \
#tail -f /var/www/atom/var/logs/*
