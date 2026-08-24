# Superstore Sales SQL Analysis

A MySQL-based analysis of the Superstore sales dataset, covering data quality checks, business KPIs, and advanced window-function analytics across 27 business questions.

## Dataset

- **Source:** [Superstore Sales Dataset — Kaggle (rohitsahoo/sales-forecasting)](https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting)
- **File:** [`data/superstore.csv`](data/superstore.csv) (included in this repo)
- **Size:** 9,800 rows, 18 columns
- **Time range:** Order dates spanning multiple years of retail transactions
- **Scope:** 4,922 unique orders, 793 unique customers, 1,861 unique products across 3 categories, 17 sub-categories, 4 regions, and 49 states

## Tools Used

- **MySQL** (MySQL Workbench)
- SQL features: aggregations, subqueries, window functions (`DENSE_RANK`, `SUM() OVER()`, `AVG() OVER()`), running totals, percentage-of-total analysis

## What's Covered

The project is split into three parts:

| File | Focus |
|---|---|
| [`sql/01_data_exploration.sql`](sql/01_data_exploration.sql) | Data quality — null checks, duplicate detection, dataset scope, distinct value checks |
| [`sql/02_business_analysis.sql`](sql/02_business_analysis.sql) | Business KPIs — top categories, products, customers, regions, states, segments, shipping modes |
| [`sql/03_advanced_analysis.sql`](sql/03_advanced_analysis.sql) | Advanced SQL — top-N-per-group ranking, running totals, percentage contribution, above-average filtering using window functions |

Full write-up of findings: [`insights.md`](insights.md)

## Key Insights

- **Total sales: $2,261,536.78** across 4,922 orders (avg. **$459.48** per order)
- **Technology** is the top-performing category, generating **$827,455.87** — **36.59%** of total sales
- **Phones** is the highest-selling sub-category ($327,782.45)
- **West** is the top region by sales ($710,219.68), and **California** the top state ($446,306.46)
- **Consumer** is the highest-revenue customer segment ($1,148,060.53)
- **Standard Class** is the most used and highest-revenue shipping mode ($1,340,831.31)
- Top customer by total sales: **Sean Miller** ($25,043.05)
- Top product by total sales: **Canon imageCLASS 2200 Advanced Copier** ($61,599.82)

## Sample Query

Finding the top 3 products by sales within each category using `DENSE_RANK()`:

```sql
SELECT category, product_name, total_sales, ranking
FROM (
    SELECT category, product_name, total_sales,
           DENSE_RANK() OVER (PARTITION BY category ORDER BY total_sales DESC) AS ranking
    FROM (
        SELECT category, product_name, ROUND(SUM(sales), 2) AS total_sales
        FROM superstore
        GROUP BY category, product_name
    ) p
) t
WHERE ranking <= 3
ORDER BY category, ranking;
```

## Skills Demonstrated

- Aggregations & `GROUP BY` analysis
- Data quality checks (nulls, duplicates)
- Subqueries & nested queries
- Window functions — `DENSE_RANK()`, running totals, percentage-of-total, above-average filtering
- Query result formatting (rounding, aliasing) for reporting

## Project Structure

```
superstore-sql-analysis/
├── README.md
├── data/
│   └── superstore.csv
├── sql/
│   ├── 01_data_exploration.sql
│   ├── 02_business_analysis.sql
│   └── 03_advanced_analysis.sql
├── outputs/
│   └── screenshots/
└── insights.md
```
