#!/bin/bash

mkdir -p mysql/init
mkdir -p mysql/data
mkdir -p mysql/secrets
mkdir -p backup/archive
mkdir -p backup/wordpress
mkdir -p backup/redmine
mkdir -p min-auth/secrets
mkdir -p wordpress/html
mkdir -p wordpress/secrets
mkdir -p redmine/files
mkdir -p redmine/secrets
mkdir -p nginx/config
mkdir -p nginx/secrets

echo -n "$(pwgen -s 29 1)" > mysql/secrets/root-password.txt
echo -n "minauth"          > min-auth/secrets/db-username.txt
echo -n "$(pwgen -s 29 1)" > min-auth/secrets/db-password.txt
echo -n "wordpress"        > wordpress/secrets/db-username.txt
echo -n "$(pwgen -s 29 1)" > wordpress/secrets/db-password.txt
echo -n "redmine"          > redmine/secrets/db-username.txt
echo -n "$(pwgen -s 29 1)" > redmine/secrets/db-password.txt

# initialize min-auth
cat <<EOF > mysql/init/min-auth.sql
CREATE USER $(cat min-auth/secrets/db-username.txt) IDENTIFIED BY '$(cat min-auth/secrets/db-password.txt)';
CREATE DATABASE minauth CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL ON minauth.* TO ${USERNAME};
USE minauth;
CREATE TABLE credentials (
    id     VARCHAR(191) NOT NULL PRIMARY KEY
,   salt   VARCHAR(191) NOT NULL
,   pwhash CHAR(64) NOT NULL
);
EOF

# initialize wordpress
cat <<EOF > mysql/init/wordpress.sql
CREATE USER $(cat wordpress/srcrets/db-username.txt) IDENTIFIED BY '$(cat wordpress/secrets/db-password.txt)';
CREATE DATABASE wordpress CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL ON wordpress.* TO ${USERNAME};
EOF

# initialize redmine
cat <<EOF > mysql/init/redmine.sql
CREATE USER $(cat redmine/secrets/db-username.txt) IDENTIFIED BY '$(cat redmine/secrets/db-password)';
CREATE DATABASE redmine CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL ON redmine.* TO ${USERNAME};
EOF

find . -type d -name secrets -exec chmod 700 "{}" \;
find . -type d -name secrets -execdir chmod 400 *.txt \;
