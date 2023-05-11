CREATE DATABASE minauth CHARSET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER minauth IDENTIFIED BY 'minauth';
GRANT ALL ON minauth.* TO minauth;
