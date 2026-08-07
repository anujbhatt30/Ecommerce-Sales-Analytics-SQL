CREATE TABLE categories(
category_id INT AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(100) UNIQUE NOT NULL
);



CREATE TABLE suppliers(
supplier_id INT AUTO_INCREMENT PRIMARY KEY,
supplier_name VARCHAR(100) NOT NULL,
contact_person VARCHAR(100),
email VARCHAR(100) UNIQUE,
phone VARCHAR(15) UNIQUE,
city VARCHAR(50),
state VARCHAR(50),
country VARCHAR(50)
);




CREATE TABLE products(
product_id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
category_id INT NOT NULL,
supplier_id INT NOT NULL,
price DECIMAL(10,2) NOT NULL CHECK(price>0),
stock INT DEFAULT 0 CHECK(stock>=0),
launch_date date ,
-- Relationship with Categories
FOREIGN KEY (category_id)          -- USING FOREIGN KEY TO MAKE THE CONNECTION WITH CATEGORIES TABLE
REFERENCES categories(category_id),
 -- Relationship with Suppliers
FOREIGN KEY (supplier_id)
REFERENCES suppliers(supplier_id) 
);



CREATE TABLE orders(
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
order_date DATE NOT NULL,
order_status ENUM('Pending','Processing','Shipped','Delivered','Cancelled','Returned')
DEFAULT 'Pending',
shipping_address  VARCHAR(225) NOT NULL,
total_amount DECIMAL(10,2) NOT NULL CHECK(total_amount>=0),
CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
);

CREATE TABLE order_items(
order_item_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL CHECK(quantity>0),
unit_price DECIMAL(10,2) NOT NULL CHECK(unit_price>=0),
CONSTRAINT fk_orderitems_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id),

CONSTRAINT fk_orderitems_product
FOREIGN KEY (product_id)
REFERENCES products(product_id)
);


CREATE TABLE payments (
payment_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
payment_date DATETIME,
payment_method ENUM('UPI','Credit Card','Debit Card','Net Banking','Wallet','Cash On Delivery'),
payment_status ENUM('Success','Failed','Pending','Refunded'),
amount DECIMAL(10,2),
transaction_id VARCHAR(100) UNIQUE,
CONSTRAINT fk_payments_order
FOREIGN KEY(order_id)
REFERENCES orders(order_id)
);


CREATE TABLE returns (
return_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
return_date DATE,
reason ENUM('Damaged Product','Wrong Product','Defective Product','Late Delivery','Size Issue','Customer Changed Mind'),
refund_amount DECIMAL(10,2),
return_status ENUM('Requested','Approved','Rejected','Completed'),
CONSTRAINT fk_returns_order
FOREIGN KEY(order_id)
REFERENCES orders(order_id)
);



select * from categories;
select * from suppliers;
select * from products;
select count(*) from customers;
select * from customers;
DESCRIBE customers;
