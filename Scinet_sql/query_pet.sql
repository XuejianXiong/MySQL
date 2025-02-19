# CREATE DATABASE pet_store;  

USE pet_store;

DROP TABLE IF EXISTS dog_breeds;

CREATE TABLE dog_breeds (
    uid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    breed_name VARCHAR(64),
    size INT,
    breed_group VARCHAR(64)
);

SHOW TABLES;

DESCRIBE dog_breeds;

INSERT INTO dog_breeds VALUES (1, 'Siberian Husky', 3, 'Working');
INSERT INTO dog_breeds VALUES (2, 'Siba', 5, 'Working');
INSERT INTO dog_breeds VALUES (3, 'Jack Russell''s Terrier', 1, 'Terrier');

SELECT * FROM dog_breeds;

#DELETE FROM dog_breeds WHERE breed_name='Siba';

INSERT INTO dog_breeds(breed_name, size, breed_group) VALUES ("Spaniel", 1, "sporting");
INSERT INTO dog_breeds(breed_name, size, breed_group) VALUES ("German Shepherd", 3, "working");
INSERT INTO dog_breeds(breed_name, size, breed_group) VALUES ("Bloodhound", 2, "hound");
INSERT INTO dog_breeds(breed_name, size, breed_group) VALUES ("Toy Poodle", 0, "toy");

SELECT * FROM dog_breeds WHERE size<2 ORDER BY size;






