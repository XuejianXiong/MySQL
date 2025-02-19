USE coss24;

DROP TABLE IF EXISTS sales_2023;
DROP TABLE IF EXISTS sales_2024;

CREATE TABLE sales_2023 (
    sale_id INT,
    sale_date DATE,
    amount DECIMAL(10, 2)
);

-- Create table sales_2024
CREATE TABLE sales_2024 (
    sale_id INT,
    sale_date DATE,
    amount DECIMAL(10, 2)
);

INSERT INTO sales_2023 (sale_id, sale_date, amount) VALUES
(1, '2023-01-01', 100.00),
(2, '2023-02-15', 150.50),
(3, '2023-03-20', 200.75),
(4, '2023-04-25', 250.00),
(5, '2023-05-30', 300.00);

INSERT INTO sales_2024 (sale_id, sale_date, amount) VALUES
(1, '2024-01-05', 120.00),
(2, '2024-02-18', 180.50),
(3, '2024-03-22', 210.75),
(4, '2024-04-27', 260.00),
(5, '2023-05-30', 300.00); -- Duplicate record

-- Select unique records
SELECT sale_id, sale_date, amount FROM sales_2023
UNION
SELECT sale_id, sale_date, amount FROM sales_2024;

-- Select all recorda
SELECT sale_id, sale_date, amount FROM sales_2023
UNION ALL
SELECT sale_id, sale_date, amount FROM sales_2024;
