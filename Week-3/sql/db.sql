CREATE DATABASE IF NOT EXISTS superstore;
USE superstore;

DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;

-- SELECT COUNT(*) FROM superstore_raw;
-- SELECT COUNT(DISTINCT `Row ID`) FROM superstore_raw;
-- SELECT MIN(`Row ID`), MAX(`Row ID`) FROM superstore_raw;

-- Creating Customers
CREATE TABLE customers (
    `Customer ID` VARCHAR(20) PRIMARY KEY,
    `Customer Name` VARCHAR(100),
    Segment VARCHAR(50)
);

-- Inserting Rows in Customers Table from superstore_raw
INSERT INTO customers (`Customer ID`, `Customer Name`, Segment)
SELECT DISTINCT
    `Customer ID`,
    `Customer Name`,
    Segment
FROM superstore_raw;

-- Creating Product Table
CREATE TABLE products (
    `Product ID` VARCHAR(30) PRIMARY KEY,
    Category VARCHAR(50),
    `Sub-Category` VARCHAR(50),
    `Product Name` VARCHAR(255)
);

-- Inserting Rows in Products Table from superstore_raw
INSERT INTO products (`Product ID`, Category, `Sub-Category`, `Product Name`)
SELECT
    `Product ID`,
    MAX(Category),
    MAX(`Sub-Category`),
    MAX(`Product Name`)
FROM superstore_raw
GROUP BY `Product ID`;

-- Creating Order Table
CREATE TABLE orders (
    `Row ID` INT PRIMARY KEY,
    `Order ID` VARCHAR(30),
    `Order Date` VARCHAR(20),
    `Ship Date` VARCHAR(20),
    `Ship Mode` VARCHAR(50),
    `Customer ID` VARCHAR(20),
    `Product ID` VARCHAR(30),
    Sales DECIMAL(10,4),
    Quantity INT,
    Discount DECIMAL(10,4),
    Profit DECIMAL(10,4)
);

-- Inserting Rows in Order Table from superstore_raw
INSERT INTO orders
(
    `Row ID`,
    `Order ID`,
    `Order Date`,
    `Ship Date`,
    `Ship Mode`,
    `Customer ID`,
    `Product ID`,
    Sales,
    Quantity,
    Discount,
    Profit
)
SELECT DISTINCT
    `Row ID`,
    `Order ID`,
    `Order Date`,
    `Ship Date`,
    `Ship Mode`,
    `Customer ID`,
    `Product ID`,
    Sales,
    Quantity,
    Discount,
    Profit
FROM superstore_raw;