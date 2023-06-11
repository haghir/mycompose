#!/bin/bash

echo -n "$(pwgen -s 29 1)" | docker secret create mysql-root-password -
echo -n "minauth" | docker secret create minauth-db-username -
echo -n "$(pwgen -s 29 1)" | docker secret create minauth-db-password -
echo -n "wordpress" | docker secret create wordpress-db-username -
echo -n "$(pwgen -s 29 1)" | docker secret create wordpress-db-password -
echo -n "redmine" | docker secret create redmine-db-username -
echo -n "$(pwgen -s 29 1)" | docker secret create redmine-db-password -
