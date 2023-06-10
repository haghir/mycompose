#!/bin/bash

USERNAME="$(cat /run/secrets/redmine-db-username)"
PASSWORD="$(cat /run/secrets/redmine-db-password)"

mysql -u root -p"$(cat /run/secrets/mysql-root-password)" <<EOF
CREATE USER ${USERNAME} IDENTIFIED BY '${PASSWORD}';
CREATE DATABASE redmine CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL ON redmine.* TO ${USERNAME};
EOF
