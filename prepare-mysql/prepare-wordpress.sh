#!/bin/bash

USERNAME="$(cat /run/secrets/wordpress-db-username)"
PASSWORD="$(cat /run/secrets/wordpress-db-password)"

mysql -u root -p"$(cat /run/secrets/mysql-root-password)" <<EOF
CREATE USER ${USERNAME} IDENTIFIED BY '${PASSWORD}';
CREATE DATABASE wordpress CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL ON wordpress.* TO ${USERNAME};
EOF
