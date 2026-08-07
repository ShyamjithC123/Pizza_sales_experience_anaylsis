SET datestyle = 'ISO, DMY';

SELECT * FROM pizza_salse;

--KPI
--01. Total Rvenue
SELECT SUM(total_price) as total_revenue
FROM pizza_salse;

--02. Total Order
SELECT COUNT(DISTINCT order_id) as total_order
FROM pizza_salse;

--03 AVG Order value
SELECT ROUND(SUM(total_price) / COUNT(DISTINCT order_id),2) as avg_order_value
FROM pizza_salse;

--04 Total Pizzas Solds
SELECT SUM(quantity) as total_pizzas_sold
FROM pizza_salse;

--05 AVG Pizzas per Order
SELECT ROUND(ROUND(SUM(quantity),2) / ROUND(COUNT(DISTINCT order_id),2),2) as avg_pizzas_per_order
FROM pizza_salse;



SELECT * FROM pizza_salse;

--ANALYSIS OR CHART
--01. Monthly Trend for Total Revenue
SELECT TO_CHAR(order_date,'MONTH') as month, SUM(total_price) as total_revenue
FROM pizza_salse
GROUP BY TO_CHAR(order_date,'MONTH');

--02. Daily Trend for Total Order
SELECT TO_CHAR(order_date,'DAY') as day , COUNT(DISTINCT order_id) as total_order
FROM pizza_salse 
GROUP BY TO_CHAR(order_date,'DAY');

--03. Percentage of Sales by Pizza Category
SELECT pizza_category, SUM(total_price) as total_revenue,
ROUND(SUM(total_price)*100/ (SELECT SUM(total_price) FROM pizza_salse),2) as percentage
FROM pizza_salse 
GROUP BY pizza_category;

--04. Percentage of Sales by Pizza Size
SELECT pizza_size, SUM(total_price) as total_revenue,
ROUND(SUM(total_price)*100/ (SELECT SUM(total_price) FROM pizza_salse),2) as percentage
FROM pizza_salse 
GROUP BY pizza_size;

SELECT * FROM pizza_salse;

--05. Total Pizzas Sold by Pizza Size and Category
SELECT pizza_size, SUM(quantity) as total_pizza_sold
FROM pizza_salse 
GROUP BY pizza_size;

SELECT pizza_category, SUM(quantity) as total_pizza_sold
FROM pizza_salse 
GROUP BY pizza_category;

---
ALTER TABLE pizza_salse 
RENAME temp_name TO pizza_name;
ALTER TABLE pizza_salse 
RENAME pizza_name TO pizza_ingredients; 
---

--06. Revenue by Pizza name
SELECT pizza_name, SUM(total_price) as revenue
FROM pizza_salse
GROUP BY pizza_name
ORDER BY revenue DESC
LIMIT 5;


SELECT * FROM pizza_salse;
--TOP & BOTTOM ANALYSIS
--01. Top Pizza by Revenue
SELECT pizza_name, SUM(total_price) as revenue
FROM pizza_salse
GROUP BY pizza_name
ORDER BY revenue DESC
LIMIT 5;

--02. Worst Pizza by Revenue
SELECT pizza_name, SUM(total_price) as revenue
FROM pizza_salse
GROUP BY pizza_name
ORDER BY revenue ASC
LIMIT 5;

--03. Top Pizza by Orders
SELECT pizza_name, COUNT(DISTINCT order_id) as total_order
FROM pizza_salse
GROUP BY pizza_name
ORDER BY total_order DESC
LIMIT 5;

--04. Worst Pizza by Orders
SELECT pizza_name, COUNT(DISTINCT order_id) as total_order
FROM pizza_salse
GROUP BY pizza_name
ORDER BY total_order ASC
LIMIT 5;

SELECT * FROM pizza_salse;
--05. Top Pizza by Quantity Sold
SELECT pizza_name, SUM(quantity) as total_Quantity_Sold
FROM pizza_salse
GROUP BY pizza_name
ORDER BY total_Quantity_Sold DESC
LIMIT 5;

--06. Worst pizza by Quantity Sold
SELECT pizza_name, SUM(quantity) as total_Quantity_Sold
FROM pizza_salse
GROUP BY pizza_name
ORDER BY total_Quantity_Sold ASC
LIMIT 5;






