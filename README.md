# PostgreSQL Retail Sales Project

## 1. Project Overview
- Database built in PostgreSQL to simulate a retail sales environment.
- Tables: customers, products, orders, order_items, payments.
- Purpose: Sales analysis, revenue tracking, and product-level & category-level insights.

## 2. Data Details
- Synthetic / dummy data used → safe for resume/interviews.
- Customers: 10
- Products: 10
- Orders: 10
- Order_items: 12
- Payments: 10

## 3. Key Analysis Done

### Basic Metrics
- Total customers:10
- Total orders: 10
- Total revenue: 170800.00
- Average order value: 17080.000000000000

### Geography Analysis
- Orders per city: 							
"Delhi"		3
"Pune"		1
"Jaipur"	1
"Chennai"	1
"Hyderabad"	1
"Bangalore"	1
"Mumbai"	1
"Ahmedabad"	1
  - Shows regional sales distribution.

### Product Analysis
- Product-wise total quantity sold & total revenue: 

"Laptop"	2	110000.00
"Smartphone"	1	30000.00
"Office Chair"	1	12000.00
"Headphones"	3	7500.00
"Desk Lamp"	2	4000.00
"Backpack"	1	1800.00
"Water Bottle"	3	1800.00
"Mouse"		2	1600.00
"Keyboard"	1	1500.00
"Notebook"	5	600.00


- Category-wise revenue:

"Electronics"	140000.00
"Furniture"	16000.00
"Accessories"	10600.00
"Lifestyle"	3600.00
"Stationery"	600.00


- Top-selling product overall: 

"Laptop"	2	110000.00



## 4. SQL Concepts Used
- CREATE TABLE with PRIMARY & FOREIGN KEYS
- INSERT with correct column mapping
- SUM(), AVG(), COUNT()
- GROUP BY, ORDER BY, LIMIT
- INNER JOINs for relational analysis

## 5. Business Insights 
- Top-selling categories & products identified → useful for procurement & marketing strategy. 
- Revenue per city → helps regional sales focus.
- Average order value → pricing & discount strategy analysis.


**## 6.  Conclusion**
This project demonstrates the ability to design a relational database and perform analytical SQL queries suitable for business reporting and decision-making.

---

## 7. Note
All data used in this project is **synthetic and self-generated** for educational and portfolio purposes.
