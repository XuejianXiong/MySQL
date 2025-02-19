USE coss24;

DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS pet_type;

CREATE TABLE pet_type(
    uid INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(64) NOT NULL,
    type VARCHAR(64) UNIQUE
);

CREATE TABLE inventory(
    uid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    type VARCHAR(64),
    cost INT DEFAULT 0,
    status VARCHAR(64) DEFAULT "for sale",
    FOREIGN KEY (type) REFERENCES pet_type(type)
);

INSERT INTO pet_type(category, type) VALUES
("Dog", "Beagle"),
("Dog", "Spaniel"),
("Dog", "Mixed"),
("Bird", "Parakeet"),
("Bird", "Parrot"),
("Cat", "Calico"),
("Turtle", "Painted Turtle"),
("Snake", "Python"),
("Rodent", "Hamster");

INSERT INTO inventory(name, type, cost, status) VALUES
("Fido", "Beagle", 150, "for sale"),
("Bella", "Spaniel", 145, "sold"),
("Tweety", "Parakeet", 15, "for sale"),
("Sir Chirps", "Parakeet", 12, "for sale"),
("Captain", "Parrot", 225, "on hold"),
("Peggy", "Parrot", 195, "sold"),
("Mittens", "Calico", 45, "for sale"),
("Slow Poke", "Painted Turtle", 75, "for sale"),
("Mr. Ssslithers", "Python", 95, "for sale"),
("Bucky", "Mixed", 50, "for sale"),
("Hammy", "Hamster", 2, "for sale"),
("hammy", "Hamster", 3, "sold");



##################################Assignment######################################

SELECT name, type, cost FROM inventory;

SELECT name, status FROM inventory WHERE status = "sold";

SELECT name, cost, status FROM inventory WHERE status != "sold";
