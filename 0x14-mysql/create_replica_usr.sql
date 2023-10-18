-- on primary mysql server, create a user for the replica server.
-- name: replica_user , hostname : % , password : replica_user_pwd
-- holberton_user have SELECT privileges on the mysql.user table in order to check that replica_user was created with the correct permissions.

CREATE USER IF NOT EXISTS 'replica_user'@'%' IDENTIFIED BY 'replica_user_pwd';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;
