#!/bin/bash

USERNAME="$(cat /run/secrets/minauth-db-username)"
PASSWORD="$(cat /run/secrets/minauth-db-password)"

mysql -u root -p"$(cat /run/secrets/mysql-root-password)" <<EOF
CREATE USER ${USERNAME} IDENTIFIED BY '${PASSWORD}';
CREATE DATABASE minauth CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL ON minauth.* TO ${USERNAME};
USE minauth;
CREATE TABLE credentials (
    id     VARCHAR(191) NOT NULL PRIMARY KEY
,   salt   VARCHAR(191) NOT NULL
,   pwhash CHAR(64) NOT NULL
);
EOF
