# CREATE DATABASE coss24;

USE coss24;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
	id INT,
	first_name VARCHAR(64),
	last_name VARCHAR(64),
	email VARCHAR(64) UNIQUE,
	hire_date DATE,
	salary DECIMAL(10, 2)
);

DESCRIBE employees;