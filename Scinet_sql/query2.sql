CREATE TABLE Users(
	UserID INT NOT NULL AUTO_INCREMENT,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
	PRIMARY KEY (UserID)
);

# Add a UNIQUE constraint to the email column in the Customers table.

ALTER TABLE Users MODIFY COLUMN Email VARCHAR(255) UNIQUE;

# Create two insert statements that add a new email to test the UNIQUE constraint.  One should succeed the other should fail.

INSERT INTO Users (UserID, Username, Email) VALUES (1, 'aaa', 'aaa@gmail.com');

INSERT INTO Users (UserID, Username, Email) VALUES (2, 'bbb', 'bbb@gmail.com');

DESCRIBE Users;
SELECT * from Users;