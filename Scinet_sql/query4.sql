USE school_db;

DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    UserID INT NOT NULL AUTO_INCREMENT, 
    Username VARCHAR(255) NOT NULL, 
    Email VARCHAR(255), 
    PRIMARY KEY (UserID) 
);

ALTER TABLE Users ADD UNIQUE (Email);

DESCRIBE Users;

INSERT INTO Users(Username, Email) 
VALUES ('Spotty', 'spotty@gmail.com');

SELECT * FROM Users;
		
#INSERT INTO Users(Username, Email) 
#VALUES ('Spotty2', 'spotty@gmail.com');

SELECT * FROM Users;
        