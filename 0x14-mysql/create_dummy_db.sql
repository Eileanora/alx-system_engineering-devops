-- create a dummy db with at least one table and one row for replication
-- in the primary server
CREATE DATABASE IF NOT EXISTS tyrell_corp;
USE tyrell_corp;
CREATE TABLE IF NOT EXISTS nexus6 (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255) NOT NULL);
INSERT INTO nexus6 (name) VALUES ('Leon');

-- make sure holberton_user has SELECT privileges on the table
GRANT SELECT ON tyrell_corp.nexus6 TO 'holberton_user'@'localhost';
