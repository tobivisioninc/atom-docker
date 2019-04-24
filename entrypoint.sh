#!/bin/bash

service apache2 restart
service mysql restart
/var/atom/bin/console.py schema create

