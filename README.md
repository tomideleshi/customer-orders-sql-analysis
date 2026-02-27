# Customer Orders SQL Analysis

## Project Overview
A SQL database project analyzing customer orders, product performance, 
and revenue insights using SQLite. Demonstrates real-world database 
design and querying skills across multiple related tables.

## Tools Used
- SQL (SQLite)
- SQLiteOnline

## Database Structure
Three related tables connected using Foreign Keys:
- **Customers** — customer details including name, region, and age
- **Products** — product catalogue with categories and pricing
- **Orders** — transaction records linking customers to products

## Queries Covered
- Filtering customers by region using WHERE
- Joining multiple tables using JOIN to create complete order views
- Aggregating customer spending using SUM and COUNT with GROUP BY
- Ranking results using ORDER BY
- Analyzing revenue by product category

## Key Business Insights
- Top spending customer: Bob Smith ($2,199)
- Second highest spender: Alice Johnson ($2,099)
- Best performing category: Electronics ($9,399 — 85% of total revenue)
- Lowest performing category: Furniture ($799)

## Business Recommendation
Focus investment on Electronics as it drives the vast majority of 
revenue. Review Furniture product lineup given significantly lower 
performance compared to other categories.
