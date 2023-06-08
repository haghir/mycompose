#!/bin/bash

pwgen -s 29 1 | docker secret create mysql-root-password -
echo -n "minauth" | docker secret create mimauth-db-username -
pwgen -s 29 1 | docker secret create mimauth-db-password -
echo -n "wordpress" | docker secret create wordpress-db-username -
pwgen -s 29 1 | docker secret create wordpress-db-password -
echo -n "redmine" | docker secret create redmine-db-username -
pwgen -s 29 1 | docker secret create redmine-db-password -
