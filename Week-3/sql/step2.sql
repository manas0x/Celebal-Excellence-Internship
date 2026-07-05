USE superstore;

-- Question 1
-- Find all orders where sales are greater than the average sales (Subquery)

SELECT *
FROM orders
WHERE Sales > (
    SELECT AVG(Sales)
    FROM orders
);

-- Question 2
-- Find the highest sales order for each customer (Subquery)

SELECT o.*
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

-- Question 3
-- Calculate total sales for each customer (CTE)

WITH CustomerSales AS (
    SELECT
        `Customer ID`,
        SUM(Sales) AS TotalSales
    FROM orders
    GROUP BY `Customer ID`
)
SELECT *
FROM CustomerSales
ORDER BY TotalSales DESC;

-- Question 4
-- Find customers whose total sales are above average (CTE + Subquery)

WITH CustomerSales AS (
    SELECT
        `Customer ID`,
        SUM(Sales) AS TotalSales
    FROM orders
    GROUP BY `Customer ID`
)
SELECT
    c.`Customer Name`,
    ROUND(cs.TotalSales, 2) AS TotalSales
FROM CustomerSales cs
JOIN customers c
ON cs.`Customer ID` = c.`Customer ID`
WHERE cs.TotalSales > (
    SELECT AVG(TotalSales)
    FROM CustomerSales
)
ORDER BY TotalSales DESC;

-- Question 5
-- Rank all customers based on total sales (Window Function)

WITH CustomerSales AS (
    SELECT
        `Customer ID`,
        SUM(Sales) AS TotalSales
    FROM orders
    GROUP BY `Customer ID`
)
SELECT
    c.`Customer Name`,
    ROUND(cs.TotalSales, 2) AS TotalSales,
    DENSE_RANK() OVER (
                        ORDER BY cs.TotalSales DESC
    ) AS CustomerRank
FROM CustomerSales cs
JOIN customers c
ON cs.`Customer ID` = c.`Customer ID`
ORDER BY CustomerRank;

-- Question 6
-- Assign row numbers to each order within a customer (Window Function + PARTITION BY)

SELECT
    `Customer ID`,
    `Order ID`,
    Sales,
    ROW_NUMBER() OVER (
        PARTITION BY `Customer ID`
        ORDER BY Sales DESC
    ) AS RowNumber
FROM orders;

-- Question 7
-- Display top 3 customers based on total sales (Window Function)

WITH CustomerSales AS (
    SELECT
        `Customer ID`,
        SUM(Sales) AS TotalSales
    FROM orders
    GROUP BY `Customer ID`
),
RankedCustomers AS (
    SELECT
        `Customer ID`,
        TotalSales,
        DENSE_RANK() OVER (
            ORDER BY TotalSales DESC
        ) AS CustomerRank
    FROM CustomerSales
)
SELECT
    c.`Customer Name`,
    ROUND(r.TotalSales, 2) AS TotalSales,
    r.CustomerRank
FROM RankedCustomers r
JOIN customers c
ON r.`Customer ID` = c.`Customer ID`
WHERE r.CustomerRank <= 3
ORDER BY r.CustomerRank;