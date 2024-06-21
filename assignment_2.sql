USE coss24;

DROP TABLE IF EXISTS Transactions;

CREATE TABLE Transactions (
    CustomerID INT,
    TransactionType ENUM("Deposit", "Withdrawal", "Interest"),
    TransacationDate DATE,
    Amount Decimal(12, 2)
);

INSERT INTO Transactions (CustomerID, TransactionType, TransacationDate, Amount) VALUES
(1, 'Deposit', '2024-01-10', 1000.00),
(1, 'Withdrawal', '2024-01-15', 200.00),
(1, 'Interest', '2024-01-20', 50.00),
(2, 'Deposit', '2024-02-05', 1500.00),
(2, 'Withdrawal', '2024-02-10', 300.00),
(2, 'Interest', '2024-02-15', 75.00),
(3, 'Deposit', '2024-03-01', 2000.00),
(3, 'Withdrawal', '2024-03-05', 500.00),
(3, 'Interest', '2024-03-10', 100.00),
(4, 'Deposit', '2024-04-01', 2500.00),
(4, 'Withdrawal', '2024-04-05', 600.00),
(4, 'Interest', '2024-04-10', 125.00),
(1, 'Deposit', '2024-05-01', 1200.00),
(2, 'Withdrawal', '2024-05-05', 400.00),
(3, 'Interest', '2024-05-10', 150.00);

################################Assignment##################################

SELECT CustomerID, COUNT(TransactionType) AS TransactionCount 
	FROM Transactions GROUP BY CustomerID;
    
SELECT CustomerID, TransactionType, SUM(Amount)
	FROM Transactions 
    WHERE TransactionType = 'Deposit'
    GROUP BY CustomerID;
    
SELECT CustomerID, TransactionType, SUM(Amount) AS TotalAmount
	FROM Transactions GROUP BY CustomerID, TransactionType
    ORDER BY TransactionType;

SELECT CustomerID, TransactionType, SUM(Amount) AS TotalAmount
	FROM Transactions 
    WHERE TransactionType = 'Deposit'
    GROUP BY CustomerID
UNION ALL 
SELECT CustomerID, TransactionType, SUM(Amount) AS TotalAmount
	FROM Transactions 
    WHERE TransactionType = 'Withdrawal'
    GROUP BY CustomerID;

SELECT 
	CustomerID, 
    SUM(CASE WHEN TransactionType = 'Deposit' THEN Amount ELSE 0 END) -
    SUM(CASE WHEN TransactionType = 'Withdrawal' THEN Amount ELSE 0 END) +
    SUM(CASE WHEN TransactionType = 'Interest' THEN Amount ELSE 0 END) 
		AS NetTotal 
FROM Transactions 
GROUP BY CustomerID;

    
