#!/bin/bash

chown -R www-data:www-data /var/www/atom/var
chown -R mysql:mysql /var/lib/mysql
/etc/init.d/apache2 start
/etc/init.d/mysql start
tail -f /var/www/atom/var/logs/*
