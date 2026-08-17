CREATE DATABASE SecurityDB1;
CREATE DATABASE SecurityDB2;

USE SecurityDB1;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    password_encrypted VARBINARY(255),
    secret_key VARCHAR(50)
);

USE SecurityDB2;

CREATE TABLE Messages (
    msg_id INT AUTO_INCREMENT PRIMARY KEY,
    original_message VARCHAR(255),
    encrypted_message VARBINARY(255),
    decrypted_message VARCHAR(255),
    hash_value VARCHAR(255),
    base64_encoded TEXT
);

USE SecurityDB1;

INSERT INTO Users (
    username,
    password_encrypted,
    secret_key
)
VALUES (
    'Allen',
    AES_ENCRYPT('mySecretPass123', 'encryption_key_123'),
    'encryption_key_123'
);

SELECT
    user_id,
    username,
    HEX(password_encrypted) AS Encrypted_Password
FROM Users;

SELECT
    username,
    CAST(AES_DECRYPT(password_encrypted, secret_key) AS CHAR) AS Decrypted_Password
FROM Users;

USE SecurityDB2;

INSERT INTO Messages (
    original_message,
    encrypted_message,
    decrypted_message,
    hash_value,
    base64_encoded
)
VALUES (
    'Secret Message',
    AES_ENCRYPT('Secret Message', 'key123'),
    CAST(AES_DECRYPT(
        AES_ENCRYPT('Secret Message', 'key123'),
        'key123'
    ) AS CHAR),
    SHA2('Secret Message', 256),
    TO_BASE64('Secret Message')
);

SELECT
    msg_id,
    original_message,
    HEX(encrypted_message) AS Encrypted_Hex,
    decrypted_message,
    hash_value,
    base64_encoded,
    CAST(FROM_BASE64(base64_encoded) AS CHAR) AS Base64_Decoded
FROM Messages;

SELECT MD5('Secret Message') AS MD5_Hash;

SELECT SHA2('Secret Message', 512) AS SHA512_Hash;

SELECT
    TO_BASE64('Confidential Data') AS Encoded,
    CAST(FROM_BASE64(
        TO_BASE64('Confidential Data')
    ) AS CHAR) AS Decoded;
