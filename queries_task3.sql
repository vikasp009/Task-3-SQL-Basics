
/* =========================================================
   Task 3: SQL Basics – Filtering, Sorting & Aggregations
   Dataset: Superstore Sales Dataset
   Author: Vikas Y
   ========================================================= */

/* ---------- 1. Table Structure ---------- */
/* Assumes database already exists */

CREATE TABLE IF NOT EXISTS superstore (
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    customer_name VARCHAR(100),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    region VARCHAR(50),
    sales DECIMAL(10,2),
    profit DECIMAL(10,2),
    quantity INT
);

/* ---------- 2. Data Verification ---------- */

-- Verify total records after CSV import
SELECT COUNT(*) AS total_records FROM superstore;

-- Preview data
SELECT * FROM superstore LIMIT 10;

/* ---------- 3. Filtering (WHERE) ---------- */

-- Orders from Technology category
SELECT *
FROM superstore
WHERE category = 'Technology';

/* ---------- 4. Sorting (ORDER BY) ---------- */

-- Top 10 orders by sales value
SELECT *
FROM superstore
ORDER BY sales DESC
LIMIT 10;

/* ---------- 5. Aggregations (GROUP BY) ---------- */

-- Total sales by category
SELECT category, SUM(sales) AS total_sales
FROM superstore
GROUP BY category;

-- Average profit by region
SELECT region, AVG(profit) AS average_profit
FROM superstore
GROUP BY region;

-- Order count per category
SELECT category, COUNT(*) AS order_count
FROM superstore
GROUP BY category;

/* ---------- 6. HAVING Clause ---------- */

-- Categories with sales greater than 100,000
SELECT category, SUM(sales) AS total_sales
FROM superstore
GROUP BY category
HAVING SUM(sales) > 100000;

/* ---------- 7. Date Range Analysis (BETWEEN) ---------- */

-- Monthly sales for January 2019
SELECT SUM(sales) AS january_sales
FROM superstore
WHERE order_date BETWEEN '2019-01-01' AND '2019-01-31';

/* ---------- 8. Pattern Matching (LIKE) ---------- */

-- Customers whose name contains 'Smith'
SELECT *
FROM superstore
WHERE customer_name LIKE '%Smith%';

/* ---------- 9. Export Ready Summary ---------- */

-- Export result as sales_summary.csv
SELECT
    category,
    SUM(sales) AS total_sales,
    AVG(profit) AS avg_profit
FROM superstore
GROUP BY category;
