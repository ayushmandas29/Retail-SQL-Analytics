-- 1. Total revenue
SELECT SUM(p.price * s.quantity) AS total_revenue
FROM Sales s
JOIN Products p ON s.product_id = p.product_id;

-- 2. Customer-wise spending
SELECT c.name, SUM(p.price * s.quantity) AS total_spent
FROM Sales s
JOIN Customers c ON s.customer_id = c.customer_id
JOIN Products p ON s.product_id = p.product_id
GROUP BY c.name;

-- 3. Most sold product (by quantity)
SELECT p.product_name, SUM(s.quantity) AS total_sold
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 1;

-- 4. Sales by city (revenue)
SELECT c.city, SUM(p.price * s.quantity) AS city_revenue
FROM Sales s
JOIN Customers c ON s.customer_id = c.customer_id
JOIN Products p ON s.product_id = p.product_id
GROUP BY c.city
ORDER BY city_revenue DESC;

-- 5. Daily revenue trend
SELECT sale_date, SUM(p.price * s.quantity) AS revenue
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY sale_date
ORDER BY sale_date;

-- 6. Top 3 highest spending customers
SELECT c.name, SUM(p.price * s.quantity) AS total_spent
FROM Sales s
JOIN Customers c ON s.customer_id = c.customer_id
JOIN Products p ON s.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 3;
