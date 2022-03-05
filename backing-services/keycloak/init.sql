CREATE DATABASE IF NOT EXISTS keycloak;
CREATE USER IF NOT EXISTS 'keycloak'@'%' IDENTIFIED BY 'keycloakPassword';
GRANT ALL PRIVILEGES ON keycloak.* TO 'keycloak'@'%';
