--Retail Sales Analysis Postrage SQL Project

-- Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

select*from customers;

-- Create Products Table

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2)
);

select* from products;

--Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

--Order_items Table

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    item_price NUMERIC(10,2),
    CONSTRAINT fk_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CONSTRAINT fk_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

--Payments Table 
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(30),
    amount NUMERIC(10,2),
    CONSTRAINT fk_order_payment
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

--  Data Insert & Analysis

-- Customer Table data insert

INSERT INTO customers (customer_id,customer_name,city) 
VALUES
(1, 'Amit Sharma', 'Delhi'),
(2, 'Neha Verma', 'Mumbai'),
(3, 'Rohit Singh', 'Bangalore'),
(4, 'Priya Patel', 'Ahmedabad'),
(5, 'Karan Mehta', 'Pune'),
(6, 'Anjali Gupta', 'Delhi'),
(7, 'Vikas Rao', 'Hyderabad'),
(8, 'Sneha Iyer', 'Chennai'),
(9, 'Rahul Khanna', 'Delhi'),
(10, 'Pooja Malhotra', 'Jaipur');

select*from customers;

--  Products Table Insert Data

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Smartphone', 'Electronics', 30000),
(103, 'Headphones', 'Accessories', 2500),
(104, 'Keyboard', 'Accessories', 1500),
(105, 'Mouse', 'Accessories', 800),
(106, 'Office Chair', 'Furniture', 12000),
(107, 'Desk Lamp', 'Furniture', 2000),
(108, 'Water Bottle', 'Lifestyle', 600),
(109, 'Backpack', 'Lifestyle', 1800),
(110, 'Notebook', 'Stationery', 120);

-- Orders Table Insert Data 

INSERT INTO orders VALUES
(1001, 1, '2025-01-05'),
(1002, 2, '2025-01-06'),
(1003, 3, '2025-01-06'),
(1004, 4, '2025-01-07'),
(1005, 5, '2025-01-08'),
(1006, 6, '2025-01-08'),
(1007, 7, '2025-01-09'),
(1008, 8, '2025-01-10'),
(1009, 9, '2025-01-10'),
(1010, 10, '2025-01-11');

select*from orders;

--Order_Items Table Insert Data

INSERT INTO order_items VALUES
(1, 1001, 101, 1, 55000),
(2, 1001, 103, 2, 2500),
(3, 1002, 102, 1, 30000),
(4, 1003, 104, 1, 1500),
(5, 1003, 105, 2, 800),
(6, 1004, 106, 1, 12000),
(7, 1005, 101, 1, 55000),
(8, 1006, 107, 2, 2000),
(9, 1007, 108, 3, 600),
(10, 1008, 109, 1, 1800),
(11, 1009, 110, 5, 120),
(12, 1010, 103, 1, 2500);

select* from order_items;

--Payments Table – INSERT DATA

INSERT INTO payments VALUES
(501, 1001, '2025-01-05', 'UPI', 60000),
(502, 1002, '2025-01-06', 'Card', 30000),
(503, 1003, '2025-01-06', 'Cash', 3100),
(504, 1004, '2025-01-07', 'UPI', 12000),
(505, 1005, '2025-01-08', 'Card', 55000),
(506, 1006, '2025-01-08', 'UPI', 4000),
(507, 1007, '2025-01-09', 'Cash', 1800),
(508, 1008, '2025-01-10', 'UPI', 1800),
(509, 1009, '2025-01-10', 'Card', 600),
(510, 1010, '2025-01-11', 'UPI', 2500);

-- Basic KPIs Analysis

-- Total Customers 
SELECT COUNT(*) AS total_customers
FROM customers;

-- Total Orders
SELECT COUNT(*) AS total_orders
from orders;

-- Total Revenue (Revenue is calculated using confirmed Paymets)
SELECT SUM(amount) AS total_revenue
FROM payments;

-- Average Order Value (AOV)
SELECT AVG(amount) AS average_order_value
FROM payments;

--Orders per City(Use Join + Group By)
SELECT 
    c.city,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_orders DESC;

-- Product-wise Revenue & Quantity Analysis

-- Query: Product-wise Total Quantity & Revenue
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * oi.item_price) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- 

-- Category-wise Revenue & Top-Selling Products

-- Query: Category-wise Total Revenue
SELECT 
    p.category,
    SUM(oi.quantity * oi.item_price) AS category_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

-- Query: Top-Selling Product Overall
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.quantity * oi.item_price) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 1;

