#CREATE DATABASE develop_course;
USE develop_course;

DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255)
);

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    product_vendor VARCHAR(100),
    price DECIMAL(10, 2),
    quantity INT
);

CREATE TABLE Sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers (first_name, last_name, email, phone, address) VALUES
('John', 'Smith', 'john.doe@example.com', '123-456-7890', '123 Elm St, Springfield'),
('Jane', 'Smith', 'jane.smith@example.com', '123-456-7891', '456 Oak St, Springfield'),
('Alice', 'Johnson', 'alice.j@example.com', '123-456-7892', '789 Pine St, Springfield'),
('Bob', 'Brown', 'bob.brown@example.com', '123-456-7893', '321 Maple St, Springfield'),
('Bob', 'Davis', 'charlie.davis@example.com', '123-456-7894', '654 Cedar St, Springfield'),
('John', 'Martinez', 'diana.m@example.com', '123-456-7895', '987 Birch St, Springfield'),
('Ethan', 'Wilson', 'ethan.w@example.com', '123-456-7896', '543 Alder St, Springfield'),
('Alice', 'Lee', 'grace.lee@example.com', '123-456-7897', '210 Sycamore St, Springfield'),
('Henry', 'Martinez', 'henry.g@example.com', '123-456-7898', '375 Poplar St, Springfield'),
('John', 'Taylor', 'isla.t@example.com', '123-456-7899', '182 Willow St, Springfield');

INSERT INTO Products (product_name, product_vendor, price, quantity) VALUES
('Widget', 'Acme Corp', 19.99, 150),
('Widget', 'Acme Corp', 18.99, 100),
('Gadget', 'Globex Inc', 29.99, 200),
('Gadget', 'Acme Corp', 34.99, 120),
('Doodad', 'Initech', 14.99, 300),
('Doodad', 'Initech', 13.99, 280),
('Gizmo', 'SoSo Inc', 22.50, 90),
('Gizmo', 'SoSo Inc', 23.50, 85),
('Widget Pro', 'Acme Corp', 25.99, 75),
('Widget Pro', 'Acme Corp', 26.99, 70),
('Gadget Max', 'Globex Inc', 39.99, 150),
('Gadget Max', 'Globex Inc', 41.99, 140),
('Doodad Plus', 'Initech', 17.50, 200),
('Doodad Plus', 'Initech', 18.50, 180),
('Gizmo Advanced', 'SoSo Inc', 30.00, 60),
('Gizmo Advanced', 'SoSo Inc', 31.00, 55),
('Super Widget', 'Acme Corp', 45.00, 50),
('Super Gadget', 'Globex Inc', 55.00, 45),
('Ultra Doodad', 'Initech', 49.99, 35),
('Mega Gizmo', 'SoSo Inc', 60.00, 20);

INSERT INTO Sales (customer_id, product_id, quantity, sale_date, total_amount) VALUES
(1, 1, 1, '2023-04-01', 1200.00),
(2, 2, 1, '2023-04-01', 700.00),
(2, 3, 2, '2023-04-02', 300.00),
(4, 4, 1, '2023-04-02', 100.00),
(1, 5, 3, '2023-04-03', 150.00),
(6, 1, 1, '2023-04-03', 1200.00),
(7, 7, 1, '2023-04-04', 400.00),
(8, 8, 2, '2023-04-04', 180.00),
(9, 9, 1, '2023-04-05', 120.00),
(10, 10, 1, '2023-04-05', 200.00),
(1, 6, 1, '2023-04-06', 300.00),
(2, 3, 2, '2023-04-06', 100.00),
(3, 4, 1, '2023-04-07', 100.00),
(2, 3, 3, '2023-04-07', 450.00),
(5, 2, 1, '2023-04-08', 700.00),
(1, 10, 2, '2023-04-08', 400.00),
(7, 9, 2, '2023-04-09', 240.00),
(8, 8, 1, '2023-04-09', 90.00),
(9, 7, 1, '2023-04-10', 400.00),
(10, 1, 2, NULL, 2400.00);