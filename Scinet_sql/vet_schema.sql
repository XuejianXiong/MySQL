use coss24;

DROP TABLE IF EXISTS Visits;
DROP TABLE IF EXISTS Vets;
DROP TABLE IF EXISTS Pets;
DROP TABLE IF EXISTS Owners;

CREATE TABLE Owners (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_name VARCHAR(100) NOT NULL
);

CREATE TABLE Pets (
    pet_id INT AUTO_INCREMENT PRIMARY KEY,
    pet_name VARCHAR(100) NOT NULL,
    pet_type VARCHAR(50),
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES Owners(owner_id)
);

CREATE TABLE Vets (
    vet_id INT AUTO_INCREMENT PRIMARY KEY,
    vet_name VARCHAR(100) NOT NULL
);

CREATE TABLE Visits (
    visit_id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT,
    vet_id INT,
    visit_date DATE,
    reason VARCHAR(255),
    FOREIGN KEY (pet_id) REFERENCES Pets(pet_id),
    FOREIGN KEY (vet_id) REFERENCES Vets(vet_id)    
);

INSERT INTO Owners (owner_name)
VALUES
('John Doe'),
('Jane Smith'),
('Alice Johnson'),
('Bob Brown');

INSERT INTO Pets (pet_name, pet_type, owner_id)
VALUES
('Buddy', 'Dog', 1),
('Mittens', 'Cat', 2),
('Charlie', 'Dog', 1),
('Max', 'Bird', NULL); -- Pet without an owner

INSERT INTO Vets (vet_name)
VALUES
('Dr. Alice'),
('Dr. Bob'),
('Dr. Carol'),
('Dr. Dave');

INSERT INTO Visits (pet_id, vet_id, visit_date, reason)
VALUES
(1, 1, '2023-01-10', 'Check-up'),
(2, 2, '2023-02-15', 'Dental Cleaning'),
(3, 1, '2023-03-20', 'Vaccination'),
(NULL, 3, '2023-04-25', 'General Checkup'); -- Visit without a pet