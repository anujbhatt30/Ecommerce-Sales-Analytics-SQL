CREATE DATABASE ecomerce_sales;
USE ecomerce_sales;
CREATE TABLE customers(
customer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone VARCHAR(15) UNIQUE,
gender ENUM('male','Female','others'),
city VARCHAR(50), 
state VARCHAR(50),
signup_date DATE NOT NULL
);

ALTER TABLE customers
ADD COLUMN country VARCHAR(50);


