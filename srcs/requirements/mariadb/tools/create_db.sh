#!/bin/sh

mysqld_safe --datadir=/var/lib/mysql --user=mysql & 

sleep 5


mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p"${DB_ROOT}" shutdown

exec mysqld --datadir=/var/lib/mysql --user=mysql 



