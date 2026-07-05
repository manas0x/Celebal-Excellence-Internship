USE superstore;

-- Step 3
-- Customer Name, Total Sales, Rank
-- (JOIN + CTE + Window Function)

WITH CustomerSales AS (
    SELECT
        `Customer ID`,
        SUM(Sales) AS TotalSales
    FROM orders
    GROUP BY `Customer ID`
),
CustomerRank AS (
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
    ROUND(cr.TotalSales,2) AS TotalSales,
    cr.CustomerRank
FROM CustomerRank cr
JOIN customers c
ON cr.`Customer ID` = c.`Customer ID`
ORDER BY cr.CustomerRank;