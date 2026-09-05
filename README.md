# 🛒 E-Commerce Sales & Customer Analysis | SQL Project

## 📌 Project Overview

This project focuses on analyzing e-commerce sales and customer data using SQL to uncover meaningful business insights related to sales performance, customer behavior, product performance, revenue trends, payment preferences, and order status.

As an aspiring **Business Analyst**, I developed this project to demonstrate my ability to transform raw business data into actionable insights using SQL. The analysis focuses not only on writing SQL queries but also on answering real-world business questions that can support data-driven decision-making.

---

## 🎯 Project Objectives

The main objective of this project is to analyze e-commerce business data and answer important business questions such as:

* How is the overall business performing?
* Which products and categories generate the highest revenue?
* Who are the most valuable customers?
* Which cities contribute the most to sales?
* How do discounts impact revenue?
* Which payment methods are preferred by customers?
* What percentage of orders are delivered, cancelled, or returned?
* How can customers be segmented based on their spending behavior?
* Which products perform above the average revenue?
* How do products rank within their respective categories?

---

## 🗂️ Dataset Information

The dataset contains approximately **1,500 e-commerce sales records** with information related to customers, products, orders, payments, discounts, and revenue.

### Dataset Columns

| Column           | Description                            |
| ---------------- | -------------------------------------- |
| order_id         | Unique identifier for each order       |
| order_date       | Date when the order was placed         |
| customer_id      | Unique identifier for each customer    |
| customer_name    | Name of the customer                   |
| gender           | Gender of the customer                 |
| age              | Age of the customer                    |
| city             | Customer's city                        |
| product_name     | Name of the purchased product          |
| category         | Product category                       |
| price            | Price of the product                   |
| quantity         | Quantity purchased                     |
| discount_percent | Discount applied to the order          |
| payment_method   | Method used for payment                |
| order_status     | Status of the order                    |
| gross_amount     | Total amount before discount           |
| discount_amount  | Discount amount applied                |
| revenue          | Final revenue generated after discount |

---

## 🛠️ Tools & Technologies Used

* **SQL**
* **PostgreSQL**
* **Excel**
* **GitHub**

---

## 🧹 Data Cleaning

Before performing the analysis, the dataset was checked for missing or null values across all important columns.

The data cleaning process included:

* Checking for NULL values
* Reviewing the dataset structure
* Validating key columns
* Exploring available product categories
* Counting total sales records

---

## 🔍 Data Exploration

Initial exploratory analysis was performed to understand the dataset.

Key exploration included:

* Total number of sales records
* Distinct product categories
* Understanding the structure and distribution of the dataset

---

# 📊 Business Questions & Analysis

## 1️⃣ Overall Business KPI Analysis

Calculated key business performance indicators:

* Total Orders
* Total Revenue
* Total Customers
* Average Order Value
* Total Quantity Sold

This provides a high-level overview of overall business performance.

---

## 2️⃣ Monthly Revenue Trend Analysis

Analyzed revenue trends across different months to identify sales patterns and determine high-performing periods.

Also analyzed yearly revenue performance to identify the best-performing year.

---

## 3️⃣ Top 5 Products by Revenue

Identified the top five products generating the highest revenue.

This analysis helps identify products that contribute significantly to overall business performance.

---

## 4️⃣ Category-Wise Performance Analysis

Analyzed product categories based on:

* Total Revenue
* Total Quantity Sold

This helps identify high-performing and low-performing product categories.

---

## 5️⃣ Top 5 Customers Analysis

Identified the top five customers based on their total spending and revenue contribution.

This analysis can help businesses identify valuable customers for loyalty programs and targeted marketing strategies.

---

## 6️⃣ City-Wise Revenue Analysis

Analyzed revenue generated across different cities.

This helps identify key geographical markets contributing the most to business sales.

---

## 7️⃣ Discount Impact Analysis

Analyzed the relationship between different discount percentages and:

* Total Orders
* Total Quantity Sold
* Total Revenue

This analysis can help businesses evaluate whether discounts are effectively contributing to sales performance.

---

## 8️⃣ Payment Method Analysis

Analyzed customer payment preferences and revenue generated through different payment methods.

This provides insights into customer purchasing behavior and preferred transaction methods.

---

## 9️⃣ Order Status Analysis

Calculated the distribution and percentage of:

* Delivered Orders
* Cancelled Orders
* Returned Orders

This analysis is useful for understanding operational performance and identifying potential issues related to cancellations and returns.

---

## 🔟 Customer Segmentation Using CASE Statements

Segmented customers into three categories based on their total spending:

| Customer Segment | Spending          |
| ---------------- | ----------------- |
| High Value       | ₹50,000 and above |
| Medium Value     | ₹20,000 – ₹49,999 |
| Low Value        | Below ₹20,000     |

This segmentation helps businesses identify valuable customers and design targeted marketing strategies.

---

## 1️⃣1️⃣ Products Performing Above Average Revenue

Used a **Subquery** to identify products generating revenue above the average product revenue.

This analysis helps identify products that outperform the overall average.

---

## 1️⃣2️⃣ Product Ranking Within Categories

Used **Window Functions and RANK()** to rank products within their respective categories based on total revenue.

This allows for a more detailed comparison of product performance within each category.

---

# 💻 SQL Concepts Demonstrated

This project demonstrates practical knowledge of the following SQL concepts:

* SELECT
* WHERE
* DISTINCT
* GROUP BY
* ORDER BY
* HAVING
* Aggregate Functions
* COUNT()
* SUM()
* AVG()
* CASE Statements
* Subqueries
* Window Functions
* RANK()
* PARTITION BY
* EXTRACT()
* Data Cleaning
* Business KPI Analysis

---

# 📈 Key Business Insights

Through this analysis, the project helps answer important business questions related to:

* Revenue performance
* Product performance
* Category performance
* Customer behavior
* Customer segmentation
* Geographic sales performance
* Discount effectiveness
* Payment preferences
* Order fulfilment performance

These insights can support business stakeholders in making more informed decisions regarding:

* Marketing strategies
* Customer retention
* Product prioritization
* Sales strategies
* Discount strategies
* Geographic expansion
* Operational improvements

---

# 📂 Project Structure

```text
E-Commerce-Sales-Customer-Analysis/
│
├── ecommerce_sales_data.csv
│
├── ecommerce_sales_analysis.sql
│
└── README.md
```

---

# 🚀 Key Skills Demonstrated

✔ Data Cleaning
✔ Exploratory Data Analysis
✔ Business KPI Analysis
✔ Customer Segmentation
✔ Sales & Revenue Analysis
✔ Product Performance Analysis
✔ Advanced SQL Queries
✔ Subqueries
✔ Window Functions
✔ Business Problem Solving

---

# 👩‍💻 About Me

Hi, I'm **Hema Jha**, an aspiring **Business Analyst** with a strong interest in transforming data into meaningful business insights.

I am continuously building projects to strengthen my skills in:

* SQL
* Excel
* Data Analysis
* Business Analysis
* Data Visualization

This project represents my hands-on practice in applying SQL to solve real-world business problems and extract actionable insights from data.

I am passionate about learning, improving my analytical skills, and building data-driven solutions that can support better business decision-making.

---

## 📬 Connect With Me

If you're interested in discussing data analytics, business analysis, or potential opportunities, feel free to connect with me on LinkedIn.

---

### ⭐ If you found this project interesting, feel free to star the repository!
