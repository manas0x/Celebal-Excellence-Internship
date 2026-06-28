USE ecommerce_sales;

-- ============================================================
-- SECTION A — SQL Basics (SELECT, Constraints, Primary Keys)
-- ============================================================

-- Q1.
SELECT * FROM customers;

-- Q2.
SELECT first_name, last_name, city FROM customers;

-- Q3.
SELECT DISTINCT category FROM products;

-- Q5.
INSERT INTO customers VALUES (109, 'Test', 'User', 'aarav.s@email.com', 'Mumbai', 'Maharashtra', '2024-09-01', FALSE);

-- Q6.
INSERT INTO products VALUES (209, 'Broken Item', 'Electronics', 'TestBrand', -50.00, 100);


-- ============================================================
-- SECTION B — Filtering & Optimization (WHERE, Indexes)
-- ============================================================

-- Q7.
SELECT * FROM orders WHERE status = 'Delivered';

-- Q8.
SELECT * FROM products WHERE category = 'Electronics' AND unit_price > 2000;

-- Q9.
SELECT * FROM customers WHERE YEAR(join_date) = 2024 AND state = 'Maharashtra';

-- Q10.
SELECT * FROM orders
WHERE order_date BETWEEN '2024-08-10' AND '2024-08-25'
  AND status <> 'Cancelled';

-- Q11.
SELECT * FROM orders WHERE order_date BETWEEN '2024-08-01' AND '2024-08-15';

-- Q12.
SELECT * FROM customers WHERE join_date >= '2024-01-01' AND join_date < '2025-01-01';


-- ============================================================
-- SECTION C — Aggregation (GROUP BY, SUM, COUNT, AVG, MIN, MAX)
-- ============================================================

-- Q13.
SELECT COUNT(*) AS total_orders FROM orders;

-- Q14.
SELECT SUM(total_amount) AS total_revenue FROM orders WHERE status = 'Delivered';

-- Q15.
SELECT category, AVG(unit_price) AS avg_price
FROM products
GROUP BY category;

-- Q16.
SELECT status,
       COUNT(*) AS order_count,
       SUM(total_amount) AS total_revenue
FROM orders
GROUP BY status
ORDER BY total_revenue DESC;

-- Q17.
SELECT category,
       MAX(unit_price) AS max_price,
       MIN(unit_price) AS min_price
FROM products
GROUP BY category;

-- Q18.
SELECT category, AVG(unit_price) AS avg_price
FROM products
GROUP BY category
HAVING AVG(unit_price) > 2000;


-- ============================================================
-- SECTION D — Joins & Relationships
-- ============================================================

-- Q19.
SELECT o.order_id, o.order_date,
       c.first_name, c.last_name,
       o.total_amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- Q20.
SELECT c.customer_id, c.first_name, c.last_name,
       o.order_id, o.order_date, o.total_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- Q21.
SELECT o.order_id,
       p.product_name,
       oi.quantity,
       oi.unit_price,
       oi.discount_pct
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p     ON oi.product_id = p.product_id;

-- Q22.
SELECT c.first_name, o.order_id
FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id
UNION
SELECT c.first_name, o.order_id
FROM customers c RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- Q23.
INSERT INTO orders VALUES (1011, 999, '2024-09-01', 'Pending', 500.00);


-- ============================================================
-- SECTION E — Advanced Concepts (CASE, ACID, Transactions)
-- ============================================================

-- Q24.
SELECT product_name,
       unit_price,
       CASE
         WHEN unit_price < 1000               THEN 'Budget'
         WHEN unit_price BETWEEN 1000 AND 3000 THEN 'Mid-Range'
         ELSE 'Premium'
       END AS price_tier
FROM products;

-- Q25.
SELECT
  SUM(CASE WHEN status = 'Delivered'  THEN 1 ELSE 0 END) AS delivered,
  SUM(CASE WHEN status <> 'Delivered' THEN 1 ELSE 0 END) AS not_delivered
FROM orders;

-- Q27.
START TRANSACTION;
INSERT INTO orders VALUES
  (1011, 102, CURDATE(), 'Pending', 1598.00);
INSERT INTO order_items VALUES
  (5016, 1011, 206, 1, 1299.00, 0),
  (5017, 1011, 208, 1,  599.00, 0);
UPDATE products SET stock_qty = stock_qty - 1 WHERE product_id = 206;
UPDATE products SET stock_qty = stock_qty - 1 WHERE product_id = 208;
COMMIT;