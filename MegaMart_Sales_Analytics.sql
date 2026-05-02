drop database if exists MegaMart;
CREATE DATABASE MegaMart;
USE MegaMart;
CREATE TABLE sales_data (
sale_id INT AUTO_INCREMENT PRIMARY KEY,
salesman_name VARCHAR(50),
region VARCHAR(30),
product_category VARCHAR(50),
quantity INT,
total_amount DECIMAL(10,2),
sale_date DATE
);
INSERT INTO sales_data (salesman_name, region, product_category, quantity, total_amount, sale_date)
VALUES
('Ali', 'North', 'Mobile', 10, 120000.00, '2025-01-15'),
('Sara', 'South', 'Laptop', 5, 350000.00, '2025-02-10'),
('Ahmed', 'East', 'TV', 3, 180000.00, '2025-03-18'),
('Raza', 'West', 'Tablet', 8, 96000.00, '2025-03-20'),
('Ali', 'North', 'Laptop', 4, 280000.00, '2025-04-05'),
('Sara', 'South', 'Mobile', 12, 144000.00, '2025-04-12'),
('Ahmed', 'East', 'Laptop', 6, 420000.00, '2025-04-25'),
('Raza', 'West', 'TV', 5, 300000.00, '2025-05-03'),
('Ali', 'North', 'TV', 2, 120000.00, '2025-05-18'),
('Sara', 'South', 'Tablet', 9, 117000.00, '2025-06-08'),
('Ahmed', 'East', 'Mobile', 7, 84000.00, '2025-06-20'),
('Raza', 'West', 'Laptop', 3, 210000.00, '2025-07-02');
select * from sales_data;
select region, count(*) AS total_sales from sales_data group by region;
select region , sum(total_amount) AS total_sales_amount from sales_data group by region;
select region , Avg(total_amount) AS avg_sales from sales_data group by region;
select product_category , min(total_amount) AS Minimum_sales from sales_data group by product_category;
select sale_date, max(total_amount) AS Maximum_sales from sales_data group by sale_date;
-- Professional addition: Filter groups using HAVING
-- Finds regions that have generated more than 500,000 in total revenue
SELECT region, SUM(total_amount) AS regional_revenue
FROM sales_data
GROUP BY region
HAVING SUM(total_amount) > 500000;