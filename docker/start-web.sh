#!/bin/bash
docker run -d \
	--name web \
	--net wordpress \
	-p 8080:80 \
	-v /vagrant/wordpress:/var/www \
	php-fpm-nginx /sbin/my_init
