USE pet_store;

DROP TABLE IF EXISTS pet_type;
DROP TABLE IF EXISTS inventory;

CREATE TABLE pet_type (
    uid INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(64) NOT NULL,
    type VARCHAR(64) UNIQUE
);

CREATE TABLE inventory (
	uid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    type VARCHAR(64),
    cost INT DEFAULT 0,
    status VARCHAR(64) DEFAULT "for sale",
    FOREIGN KEY (type) REFERENCES pet_type(type)
);


DESCRIBE pet_type;
DESCRIBE inventory;
