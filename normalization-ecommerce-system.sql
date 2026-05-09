/*
 * PROJECT: E-Commerce Normalization & Advanced Relational Mapping
 * GOAL: Transition from unoptimized "Flat-File" data to 3rd Normal Form (3NF).
 * CONCEPTS: 1NF, 2NF, 3NF, Foreign Keys, Inner Joins, Data Integrity.
 * AUTHOR: Aisha Riaz
 */

-- ---------------------------------------------------------
-- STEP 1: The "Unnormalized" Mess (The Starting Point)
-- ---------------------------------------------------------
-- This table has redundant data (repeating customer names and categories).
CREATE TABLE unnormalized_sales (
    OrderID INT,
    CustomerName VARCHAR(100),
    CustomerEmail VARCHAR(100),
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    OrderDate DATE
);

-- ---------------------------------------------------------
-- STEP 2: 3rd Normal Form (3NF) Architecture
-- ---------------------------------------------------------

-- Table 1: Customers (Separating entity data)
CREATE TABLE customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Table 2: Categories (Eliminating transitive dependencies)
CREATE TABLE categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50) NOT NULL
);

-- Table 3: Products (Linked to Categories via Foreign Key)
CREATE TABLE products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT,
    Price DECIMAL(10,2) CHECK (Price > 0),
    FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID)
);

-- Table 4: Orders (The Junction linking Customers and Products)
CREATE TABLE orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);

-- ---------------------------------------------------------
-- STEP 3: Advanced Relational Queries (The "Joins")
-- ---------------------------------------------------------

-- Proving the 3NF structure works by reconstructing the data
SELECT 
    o.OrderID,
    c.FullName AS Customer,
    p.ProductName,
    cat.CategoryName AS Category,
    p.Price,
    o.OrderDate
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID
JOIN products p ON o.ProductID = p.ProductID
JOIN categories cat ON p.CategoryID = cat.CategoryID
ORDER BY o.OrderDate DESC;
