CREATE DATABASE role_based_demo;
CREATE DATABASE analytics_db;

USE role_based_demo;

CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    role VARCHAR(30)
);

USE analytics_db;

CREATE TABLE reports (
    report_id INT PRIMARY KEY,
    report_name VARCHAR(100),
    created_on DATE
);

CREATE ROLE 'system_admin';
CREATE ROLE 'data_analyst_role';
CREATE ROLE 'read_only_user';

CREATE USER 'sysadmin'@'localhost'
IDENTIFIED BY 'password123';

CREATE USER 'data_analyst'@'localhost'
IDENTIFIED BY 'password123';

CREATE USER 'readonly1'@'localhost'
IDENTIFIED BY 'password123';

GRANT ALL PRIVILEGES
ON role_based_demo.*
TO 'system_admin';

GRANT ALL PRIVILEGES
ON analytics_db.*
TO 'system_admin';

GRANT SELECT, UPDATE
ON role_based_demo.users
TO 'data_analyst_role';

GRANT SELECT
ON analytics_db.reports
TO 'data_analyst_role';

GRANT SELECT
ON role_based_demo.users
TO 'read_only_user';

GRANT 'system_admin'
TO 'sysadmin'@'localhost';

GRANT 'data_analyst_role'
TO 'data_analyst'@'localhost';

GRANT 'read_only_user'
TO 'readonly1'@'localhost';

SET DEFAULT ROLE ALL
TO 'sysadmin'@'localhost';

SET DEFAULT ROLE 'data_analyst_role'
TO 'data_analyst'@'localhost';

SET DEFAULT ROLE 'read_only_user'
TO 'readonly1'@'localhost';

USE role_based_demo;

CREATE VIEW analyst_view AS
SELECT id, name
FROM users
WHERE role = 'Analyst';

GRANT SELECT
ON role_based_demo.analyst_view
TO 'data_analyst_role';

DELIMITER //

CREATE PROCEDURE add_user(
    IN uid INT,
    IN uname VARCHAR(50),
    IN urole VARCHAR(30)
)
BEGIN
    INSERT INTO role_based_demo.users
    VALUES (uid, uname, urole);
END //

DELIMITER ;

GRANT EXECUTE
ON PROCEDURE role_based_demo.add_user
TO 'system_admin';

REVOKE UPDATE
ON role_based_demo.users
FROM 'data_analyst_role';

CREATE TABLE audit_log (
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_name VARCHAR(50),
    action_performed VARCHAR(100)
);

DELIMITER //

CREATE TRIGGER log_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (user_name, action_performed)
    VALUES (
        CURRENT_USER(),
        CONCAT('Inserted user: ', NEW.name)
    );
END //

DELIMITER ;

CALL add_user(1, 'John Doe', 'Admin');

INSERT INTO analytics_db.reports
VALUES (1, 'Monthly Report', CURDATE());

SELECT * FROM analyst_view;

UPDATE role_based_demo.users
SET name = 'Updated Analyst'
WHERE id = 1;

DELETE FROM role_based_demo.users
WHERE id = 1;

SELECT * FROM role_based_demo.users;

INSERT INTO role_based_demo.users
VALUES (2, 'Test', 'User');
