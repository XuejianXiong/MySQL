SELECT COUNT(sale_date), COUNT(total_amount) FROM Sales;

SELECT COUNT(*) FROM Sales where customer_id = 1;

SELECT first_name, COUNT(last_name) AS count FROM customers GROUP BY first_name;
INSERT INTO customers (first_name, last_name) VALUES ("John", "Smith");
SELECT first_name, COUNT(last_name) AS count FROM customers GROUP BY first_name;

SELECT customer_id, product_id, COUNT(*) AS count FROM Sales 
	GROUP BY customer_id, product_id;
    
SELECT COUNT(DISTINCT last_name) AS num_last_name FROM Customers;
SELECT DISTINCT last_name FROM Customers;

SELECT SUM(total_amount) FROM sales;

SELECT 
    CONCAT_WS(" ", product_vendor, product_name) AS name,
    AVG(price) AS average_price 
    FROM products GROUP BY name;

# CAST is changing the format of a piece of data
SELECT
    CONCAT_WS(" ", product_vendor, product_name) AS product,
    CAST(AVG(price) AS DECIMAL(10, 2)) AS average_price
	FROM products GROUP BY product;

SELECT product_name, MIN(price), MAX(price) 
	FROM products GROUP BY product_name;
    
SELECT 
    COUNT(CASE WHEN product_vendor = "Acme Corp" THEN 1 END)
	AS Acme_Corp_Product 
	FROM Products;
    
SELECT 
    product_name,
    COUNT(CASE WHEN product_vendor = "Acme Corp" THEN 1 END )
	AS Acme_Corp_Product 
	FROM Products GROUP BY product_name;    
    
    
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

SELECT NOW();
    