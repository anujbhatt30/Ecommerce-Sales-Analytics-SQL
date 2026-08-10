-- View all tables
SHOW TABLES;

-- View table structure
DESC categories;
DESC suppliers;
DESC products;
DESC customers;
DESC orders;
DESC order_items;
DESC payments;
DESC returns;


-- Preview data
SELECT * FROM categories LIMIT 10;
SELECT * FROM suppliers LIMIT 10;
SELECT * FROM products LIMIT 10;
SELECT * FROM customers LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM order_items LIMIT 10;
SELECT * FROM payments LIMIT 10;
SELECT * FROM returns LIMIT 10;


-- Total records in each table
SELECT COUNT(*) AS Categories FROM categories;
SELECT COUNT(*) AS Suppliers FROM suppliers;
SELECT COUNT(*) AS Products FROM products;
SELECT COUNT(*) AS Customers FROM customers;
SELECT COUNT(*) AS Orders FROM orders;
SELECT COUNT(*) AS OrderItems FROM order_items;
SELECT COUNT(*) AS Payments FROM payments;
SELECT COUNT(*) AS Returns FROM returns;


-- Checking Null
SELECT *
FROM customers
WHERE customer_name IS NULL;


SELECT *
FROM products
WHERE product_name IS NULL;


SELECT *
FROM orders
WHERE customer_id IS NULL;


-- Duplicate Customers
SELECT customer_id,COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*)>1;


-- 1) Total Revenue:
SELECT 
SUM(oi.quantity*oi.unit_price) as Total_Revenue
FROM
order_items oi;


-- 2) Total orders:
SELECT 
COUNT(order_id) as Total_Orders
FROM
order_items;            -- Total orders=150232


-- 3) Average Order Value:
SELECT ROUND(SUM(oi.quantity * oi.unit_price)/COUNT(order_id),2) AS Avg_Order_Value
FROM order_items oi;


-- 4) Monthly Revenue:
SELECT
YEAR(O.order_date) AS Year,
MONTH(O.order_date) AS Month,
ROUND(SUM(OI.quantity * OI.unit_price),2) AS Total_Revenue
FROM orders O  
JOIN order_items OI
ON O.order_id = OI.order_id
GROUP BY YEAR,MONTH
ORDER BY YEAR,MONTH;


-- 5) Total Customers:
SELECT COUNT(*) AS Total_Customers FROM customers;


-- 6) Customer Purchase Frequency:
SELECT 
customer_id,
COUNT(order_id) AS Orders_Placed 
FROM orders
GROUP BY customer_id
ORDER by Orders_Placed DESC;




