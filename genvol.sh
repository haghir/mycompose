#!/bin/bash

docker volume create backup-archives
docker volume create mysql-data
docker volume create wordpress-html
docker volume create redmine-files
