#!/bin/bash

mkdir -p mysql/init
mkdir -p mysql/data
mkdir -p mysql/secrets
mkdir -p backup/archives
mkdir -p min-auth/secrets
mkdir -p wordpress/html
mkdir -p wordpress/secrets
mkdir -p redmine/files
mkdir -p redmine/secrets
mkdir -p nginx/config
mkdir -p nginx/secrets

echo -n "$(pwgen -s 29 1)" > mysql/secrets/root-password.txt
echo -n "minauth" > min-auth/secrets/db-username.txt
echo -n "$(pwgen -s 29 1)" > min-auth/secrets/db-password.txt
echo -n "wordpress" > wordpress/secrets/db-username.txt
echo -n "$(pwgen -s 29 1)" > wordpress/secrets/db-password.txt
echo -n "redmine" > redmine/secrets/db-username.txt
echo -n "$(pwgen -s 29 1)" > redmine/secrets/db-password.txt

find . -type d -name secrets | while read DPATH ; do
	chmod 700 "${DPATH}"
	find "${DPATH}" -type f -name "*.txt" -execdir chmod 400 "{}" \;
done

# alter root
cat <<EOF > mysql/init/root.sql
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '$(cat mysql/secrets/root-password.txt)';
EOF

# initialize min-auth
cat <<EOF > mysql/init/min-auth.sql
CREATE USER $(cat min-auth/secrets/db-username.txt) IDENTIFIED WITH mysql_native_password BY '$(cat min-auth/secrets/db-password.txt)';
CREATE DATABASE minauth CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL ON minauth.* TO $(cat min-auth/secrets/db-username.txt);
USE minauth;
CREATE TABLE credentials (
    id     VARCHAR(191) NOT NULL PRIMARY KEY
,   salt   VARCHAR(191) NOT NULL
,   pwhash CHAR(64) NOT NULL
);
EOF

# initialize wordpress
cat <<EOF > mysql/init/wordpress.sql
CREATE USER $(cat wordpress/secrets/db-username.txt) IDENTIFIED WITH mysql_native_password BY '$(cat wordpress/secrets/db-password.txt)';
CREATE DATABASE wordpress CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL ON wordpress.* TO $(cat wordpress/secrets/db-username.txt);
EOF

# initialize redmine
cat <<EOF > mysql/init/redmine.sql
CREATE USER $(cat redmine/secrets/db-username.txt) IDENTIFIED WITH mysql_native_password BY '$(cat redmine/secrets/db-password.txt)';
CREATE DATABASE redmine CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL ON redmine.* TO $(cat redmine/secrets/db-username.txt);
EOF
