CREATE DATABASE wordpress CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER wordpress IDENTIFIED BY 'wordpress';
GRANT ALL ON wordpress.* TO wordpress;
