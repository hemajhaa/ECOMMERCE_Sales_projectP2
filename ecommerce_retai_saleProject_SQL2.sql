-- Database: e-commerce_sales_analysis

-- DROP DATABASE IF EXISTS "e-commerce_sales_analysis";

-- CREATE TABLE 
CREATE TABLE ecommerce_sales (
    order_id VARCHAR(10) PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(10),
    customer_name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2),
    quantity INT,
    discount_percent NUMERIC(5,2),
    payment_method VARCHAR(30),
    order_status VARCHAR(30),
    gross_amount NUMERIC(12,2),
    discount_amount NUMERIC(12,2),
    revenue NUMERIC(12,2)
);

-- DATA CLEANING ( checking if any NULL value is there)
SELECT * FROM ecommerce_sales
WHERE 
order_id IS NULL
OR 
order_date IS NULL
OR 
customer_id IS NULL
OR
customer_name IS NULL
OR 
gender IS NULL
OR
age IS NULL
OR 
city IS NULL
OR
product_name IS NULL
OR
category IS NULL
OR
price IS NULL
OR
quantity IS NULL
OR
discount_percent IS NULL
OR
payment_method IS NULL
OR
order_status IS NULL
OR
gross_amount IS NULL
OR
discount_amount IS NULL
OR
revenue IS NULL;

-- DATA EXPLORATION

-- How many sales we have?
SELECT COUNT(*) AS total_sales FROM ecommerce_sales

SELECT DISTINCT(category) FROM ecommerce_sales

--BUSINESS ANALYSIS & BUSINESS KEY PROBLEMS:

--E-COMMERCE SALES & CUSTOMER ANALYSIS – BUSINESS QUESTIONS

--1. Calculate the overall business KPIs: Total Orders, Total Revenue, Total Customers, Average Order Value, and Total Quantity Sold.

--2. Analyze monthly revenue trends and identify the best-performing month based on revenue.

--3. Identify the top 5 products generating the highest revenue.

--4. Analyze category-wise performance by calculating total revenue and total quantity sold for each category.

--5. Identify the top 5 customers based on total revenue generated.

--6. Analyze city-wise revenue and identify which cities contribute the most to total sales.

--7. Evaluate the impact of discounts by comparing total revenue across different discount percentages.

--8. Analyze payment method preferences and determine which payment method generates the highest revenue.

--9. Calculate the order status distribution and identify the percentage of Delivered, Cancelled, and Returned orders.

--10. Segment customers into Low, Medium, and High Value customers based on their total spending using CASE statements.

--11. Identify products that are performing above the average product revenue using a subquery.

--12. Rank products within each category based on revenue using Window Functions.


--SOLUTION OF PROJECT :
--1. Calculate the overall business KPIs: Total Orders, Total Revenue, Total Customers, Average Order Value, and Total Quantity Sold.
SELECT* FROM ecommerce_sales

SELECT COUNT(DISTINCT order_id) AS total_orders,
ROUND(SUM(revenue),2) AS total_revenue,
COUNT(DISTINCT customer_id) AS total_customers,
ROUND(AVG(revenue),2) AS avg_order_value ,
SUM(quantity) AS total_quantity
FROM ecommerce_sales
WHERE order_status = 'Delivered';

-- 2. Analyze monthly revenue trends and identify the best-performing month based on revenue.

SELECT 
EXTRACT(MONTH FROM order_date) AS month,
SUM(revenue) AS total_revenue
FROM ecommerce_sales
WHERE order_status = 'Delivered'
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY total_revenue DESC;

-- SHOWING BEST-PERFORMING YEAR BASED ON REVENUE.
SELECT 
EXTRACT(YEAR FROM order_date) AS year,
SUM(revenue) AS total_revenue
FROM ecommerce_sales
WHERE order_status = 'Delivered'
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY total_revenue DESC;

--3. Identify the top 5 products generating the highest revenue.
SELECT 
product_name AS product,
SUM(revenue) AS total_revenue
FROM ecommerce_sales
WHERE order_status = 'Delivered'
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 5;

--4. Analyze category-wise performance by calculating total revenue and total quantity sold for each category.
SELECT 
category ,
ROUND(SUM(revenue),2) AS total_revenue ,
SUM(quantity) AS quanity_of_sale
FROM ecommerce_sales
WHERE order_status = 'Delivered'
GROUP BY category;

--5. Identify the top 5 customers based on total revenue generated.
SELECT 
DISTINCT(customer_id) AS customer_id,
customer_name ,
ROUND(SUM(revenue),2) AS total_revenue
FROM ecommerce_sales
WHERE order_status ='Delivered'
GROUP BY customer_id,
         customer_name
ORDER BY total_revenue DESC
LIMIT 5;

--6. Analyze city-wise revenue and identify which cities contribute the most to total sales.
SELECT 
    city,
    ROUND(SUM(revenue), 2) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM ecommerce_sales
WHERE order_status = 'Delivered'
GROUP BY city
ORDER BY total_revenue DESC;

-- 7. Evaluate the impact of discounts by comparing total revenue across different discount percentages.
SELECT
discount_percent ,
COUNT(order_id) AS total_order,
SUM(quantity) AS total_quantity,
ROUND(SUM(revenue),2) AS total_revenue
FROM ecommerce_sales
WHERE order_status = 'Delivered'
GROUP BY discount_percent
ORDER BY total_revenue;

-- 8. Analyze payment method preferences and determine which payment method generates the highest revenue.
SELECT 
payment_method ,
COUNT(*) AS total_orders,
ROUND(SUM(revenue),2) AS total_revenue
FROM ecommerce_sales
WHERE order_status = 'Delivered'
GROUP BY payment_method
ORDER BY total_revenue DESC ;

--9. Calculate the order status distribution and identify the percentage of Delivered, Cancelled, and Returned orders.
SELECT 
       order_status ,
COUNT(*) AS total_orders,
ROUND(
COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),2
) AS percentage
FROM ecommerce_sales
GROUP BY order_status
ORDER BY percentage DESC;

--10. Segment customers into Low, Medium, and High Value customers based on their total spending using CASE statements.
SELECT customer_id,
customer_name,
ROUND(SUM(revenue),2) AS total_spending,
  CASE
      WHEN SUM(revenue) >= 50000 THEN 'High value'
	  WHEN SUM(revenue) >= 20000 THEN 'Medium value'
	  ELSE 'low value'
	 END AS customer_profile
FROM 
     ecommerce_sales
WHERE order_status = 'Delivered'
GROUP BY customer_id,
         customer_name
ORDER BY total_spending DESC;

--11. Identify products that are performing above the average product revenue using a subquery.

SELECT 
    product_name,
    SUM(revenue) AS total_revenue
FROM ecommerce_sales
WHERE order_status = 'Delivered'
GROUP BY product_name
HAVING SUM(revenue) > (
    
    SELECT AVG(product_revenue)
    FROM (
        SELECT SUM(revenue) AS product_revenue
        FROM ecommerce_sales
        WHERE order_status = 'Delivered'
        GROUP BY product_name
    ) AS avg_table
    
)
ORDER BY total_revenue DESC;

--12. Rank products within each category based on revenue using Window Functions.
SELECT 
    category,
    product_name,
    total_revenue,
    
    RANK() OVER(
        PARTITION BY category 
        ORDER BY total_revenue DESC
    ) AS product_rank

FROM (

    SELECT 
        category,
        product_name,
        SUM(revenue) AS total_revenue
    FROM ecommerce_sales
    WHERE order_status = 'Delivered'
    GROUP BY 
        category,
        product_name

) AS product_sales;
