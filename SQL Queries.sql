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
SELECT COUNT(*) AS Total_Customers
FROM customers;


-- 6) Customer Purchase Frequency:
SELECT 
customer_id,
COUNT(order_id) AS Orders_Placed 
FROM orders
GROUP BY customer_id
ORDER by Orders_Placed DESC;


-- 7) Products By Suppliers:
SELECT (s.supplier_name),COUNT(p.product_id) AS Total_products
FROM suppliers s
JOIN products p 
ON s.supplier_id=p.supplier_id
GROUP by s.supplier_name
ORDER BY Total_products DESC;


-- 8) Payment Analysis:

-- a) Payment Platforms:-
SELECT payment_method,
COUNT(*) AS Transactions 
FROM payments
GROUP BY payment_method
ORDER BY Transactions DESC;

-- b) Payment Collections From Different Platforms:-
SELECT payment_method AS Payment_Platforms,
ROUND(SUM(amount),2) AS Total_Collection
FROM payments
GROUP BY payment_method;
 

-- 9) Return Analysis

-- a) Return Orders:-
SELECT COUNT(*) AS Total_Returns 
FROM returns;

-- b) Return Percentage:-
SELECT ROUND(COUNT(r.return_id)*100.0/COUNT(DISTINCT o.order_id),2)
AS Return_Rate
FROM orders o
LEFT JOIN returns r
ON o.order_id=r.order_id; 


-- 10) Top 5 Customers:
SELECT * FROM 
(SELECT
c.first_name,  
SUM(oi.quantity * oi.unit_price) AS Spending,
RANK() OVER(ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS Customer_Rank
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN order_items oi
ON o.order_id=oi.order_id
GROUP BY c.first_name)t
WHERE Customer_Rank <=5;


-- 11) Top Product in Each Category:
WITH ProductSales
AS 
(SELECT
c.category_name,
p.product_name,
SUM(oi.quantity) AS Qty
FROM categories c
JOIN products p
ON c.category_id=p.category_id
JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY c.category_name,p.product_name)
SELECT * FROM
ProductSales;
 

-- 12)Highest Spending Customer:
SELECT
Customer_name,
Total_spent 
FROM
(SELECT 
CONCAT(c.first_name,'',c.last_name) AS Customer_name,
SUM(oi.quantity*oi.unit_price) AS Total_Spent
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN order_items oi
ON o.order_id=oi.order_id
GROUP BY c.first_name,c.last_name)t
ORDER BY Total_Spent DESC
LIMIT 1;

