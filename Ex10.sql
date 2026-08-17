CREATE DATABASE IF NOT EXISTS sqli_demo;

USE sqli_demo;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) DEFAULT 'user'
);

INSERT INTO users (username, password, role) VALUES
('admin', 'p@ssw0rd', 'admin'),
('alice', 'alicepwd', 'user'),
('bob', 'bobpwd', 'user');

SET @user_input := 'admin';

SET @vuln_sql := CONCAT(
    'SELECT id,username,password FROM users WHERE username = ''',
    @user_input,
    ''';'
);

PREPARE p FROM @vuln_sql;

EXECUTE p;

DEALLOCATE PREPARE p;

SET @user_input := ''' OR ''1''=''1';

SET @vuln_sql := CONCAT(
    'SELECT id,username,password FROM users WHERE username = ''',
    @user_input,
    ''';'
);

PREPARE p2 FROM @vuln_sql;

EXECUTE p2;

DEALLOCATE PREPARE p2;

SELECT id, username, password
FROM users
WHERE username = '' OR '1'='1';

SET @sql := 'SELECT id, username FROM users WHERE username = ?';

PREPARE safe_stmt FROM @sql;

SET @u := 'admin';

EXECUTE safe_stmt USING @u;

SET @u := ''' OR ''1''=''1';

EXECUTE safe_stmt USING @u;

DEALLOCATE PREPARE safe_stmt;

DELIMITER $$

CREATE PROCEDURE get_user(IN p_username VARCHAR(50))
BEGIN
    SET @sql = 'SELECT id, username FROM users WHERE username = ?';
    PREPARE s FROM @sql;
    SET @p = p_username;
    EXECUTE s USING @p;
    DEALLOCATE PREPARE s;
END$$

DELIMITER ;

CALL get_user('alice');

CALL get_user(''' OR ''1''=''1');

CREATE OR REPLACE VIEW v_users AS
SELECT id, username, role
FROM users;

CREATE USER IF NOT EXISTS 'app_user'@'localhost'
IDENTIFIED BY 'app_pass';

GRANT SELECT
ON sqli_demo.v_users
TO 'app_user'@'localhost';

REVOKE SELECT
ON sqli_demo.users
FROM 'app_user'@'localhost';

FLUSH PRIVILEGES;

DELIMITER $$

CREATE PROCEDURE get_user_by_id_strict(IN p_id_str VARCHAR(20))
BEGIN
    IF p_id_str REGEXP '^[0-9]+$' THEN
        SET @idnum := CAST(p_id_str AS UNSIGNED);

        PREPARE q FROM
        'SELECT id, username FROM users WHERE id = ?';

        EXECUTE q USING @idnum;

        DEALLOCATE PREPARE q;
    ELSE
        SELECT 'ERROR: invalid id format' AS error;
    END IF;
END$$

DELIMITER ;

CALL get_user_by_id_strict('1');

CALL get_user_by_id_strict('1 OR 1=1');

DROP PROCEDURE IF EXISTS get_user;

DROP PROCEDURE IF EXISTS get_user_by_id_strict;

DROP VIEW IF EXISTS v_users;

DROP USER IF EXISTS 'app_user'@'localhost';

DROP DATABASE IF EXISTS sqli_demo;
