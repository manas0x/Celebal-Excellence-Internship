USE superstore;

-- Question 1
-- Top 5 customers

WITH CustomerSales AS (
    SELECT
        `Customer ID`,
        SUM(Sales) AS TotalSales
    FROM orders
    GROUP BY `Customer ID`
)
SELECT
    c.`Customer Name`,
    ROUND(cs.TotalSales,2) AS TotalSales
FROM CustomerSales cs
JOIN customers c
ON cs.`Customer ID` = c.`Customer ID`
ORDER BY TotalSales DESC
LIMIT 5;

-- Question 2
-- Bottom 5 customers

WITH CustomerSales AS (
    SELECT
        `Customer ID`,
        SUM(Sales) AS TotalSales
    FROM orders
    GROUP BY `Customer ID`
)
SELECT
    c.`Customer Name`,
    ROUND(cs.TotalSales,2) AS TotalSales
FROM CustomerSales cs
JOIN customers c
ON cs.`Customer ID` = c.`Customer ID`
ORDER BY TotalSales
LIMIT 5;

-- Question 3
-- Customers who made only one order

SELECT
    c.`Customer ID`,
    c.`Customer Name`,
    c.Segment
FROM customers c
JOIN (
    SELECT
        `Customer ID`
    FROM orders
    GROUP BY `Customer ID`
    HAVING COUNT(DISTINCT `Order ID`) = 1
) o
ON c.`Customer ID` = o.`Customer ID`;

-- Question 4
-- Customers with above-average sales

WITH CustomerSales AS (
    SELECT
        `Customer ID`,
        SUM(Sales) AS TotalSales
    FROM orders
    GROUP BY `Customer ID`
)
SELECT
    c.`Customer Name`,
    ROUND(cs.TotalSales,2) AS TotalSales
FROM CustomerSales cs
JOIN customers c
ON cs.`Customer ID` = c.`Customer ID`
WHERE cs.TotalSales > (
    SELECT AVG(TotalSales)
    FROM CustomerSales
)
ORDER BY TotalSales DESC;

-- Question 5
-- Highest order value per customer

SELECT
    o.*
FROM orders o
JOIN (
    SELECT
        `Customer ID`,
        MAX(Sales) AS MaxSales
    FROM orders
    GROUP BY `Customer ID`
) m
ON o.`Customer ID` = m.`Customer ID`
AND o.Sales = m.MaxSales
ORDER BY o.Sales DESC;