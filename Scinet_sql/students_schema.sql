USE coss24;

DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Instructors;

CREATE TABLE Students (
    uid INT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    advisor_id INT
);

CREATE TABLE Instructors (
    uid INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    manager_id INT
);

INSERT INTO Students (uid, first_name, last_name, email, advisor_id) VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', null),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 2),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', 3),
(4, 'Bob', 'Brown', 'bob.brown@example.com', 2),
(5, 'Charlie', 'Davis', 'charlie.davis@example.com', null),
(6, 'Dave', 'Miller', 'dave.miller@example.com', 2),
(7, 'Eve', 'Wilson', 'eve.wilson@example.com', 3),
(8, 'Frank', 'Moore', 'frank.moore@example.com', 4),
(9, 'Grace', 'Taylor', 'grace.taylor@example.com', null),
(10, 'Hank', 'Anderson', 'hank.anderson@example.com', 2),
(11, 'Phill', 'Phillerson', 'phil.phillerson@example.com', null);

INSERT INTO Instructors (uid, first_name, last_name, email, manager_id) VALUES 
(1, 'Dr. Adam', 'Lee', 'adam.lee@example.com', NULL),
(2, 'Dr. Beth', 'Kim', 'beth.kim@example.com', 1),
(3, 'Dr. Carl', 'Nguyen', 'carl.nguyen@example.com', 1),
(4, 'Dr. Diana', 'Perez', 'diana.perez@example.com', 2);

ALTER TABLE Students MODIFY COLUMN uid INT PRIMARY KEY;
ALTER TABLE Students ADD FOREIGN KEY (advisor_id) REFERENCES Instructors(uid);

INSERT INTO Students (uid, first_name, last_name) 
VALUES (12, "John", "Doe"), (13, "Alan", "Y");

SELECT * from Students;