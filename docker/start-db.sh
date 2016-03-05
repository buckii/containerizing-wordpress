#!/bin/bash
docker run -d \
	--name db \
	--net wordpress \
	-v wordpress_db_data:/var/lib/mysql \
	-e MYSQL_ROOT_PASSWORD=root \
	mariadb:10.1 mysqld
