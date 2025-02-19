USE pet_store;

DROP TABLE IF EXISTS users;

CREATE TABLE users(
	uid INT AUTO_INCREMENT,
	name VARCHAR(32) NOT NULL DEFAULT 'N/A', 
    age INT NOT NULL DEFAULT -1,
    CONSTRAINT chk_age CHECK (age > 18),
    PRIMARY KEY (uid)
);

INSERT INTO users (name, age) values ("", 30);
#INSERT INTO users (name) values ("billy");
INSERT INTO users (age) values (25);
#INSERT INTO users() values();
#INSERT INTO users(name, age) VALUES (NULL, NULL);

INSERT INTO users (name, age) VALUES ("Bob", 19);

INSERT INTO users (uid, name, age) VALUES (37, "Steve", 46);

INSERT INTO users (name, age) VALUES ("Alan", 20);

SHOW tables;
DESCRIBE users;
#SELECT * FROM users WHERE name IS NOT NULL;
SELECT * FROM users;

DELETE FROM users  WHERE uid = 37;
SELECT * FROM users;

ALTER TABLE users AUTO_INCREMENT = 1000;
INSERT INTO users (name, age)  VALUES ("Billy Bob", 37);
SELECT * FROM users;


DROP TABLE IF EXISTS inventory;

CREATE TABLE inventory (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(64),
    status ENUM('for sale', 'sold', 'on hold') DEFAULT 'for sale'
);

INSERT INTO inventory (name) VALUES ('Bob');

SELECT * FROM inventory WHERE status = 'sold';
UPDATE inventory SET status = 'sold' WHERE id > 5;