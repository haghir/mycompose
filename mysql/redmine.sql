CREATE DATABASE redmine CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER redmine IDENTIFIED BY 'redmine';
GRANT ALL ON redmine.* TO redmine;
