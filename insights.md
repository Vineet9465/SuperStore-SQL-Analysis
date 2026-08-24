# Key Insights — Superstore Sales Analysis

A summary of the main findings from the SQL analysis, in plain English. Full queries are in the [`sql/`](sql/) folder.

## Overall Performance

- **Total sales:** $2,261,536.78 across 4,922 unique orders
- **Average sales per order:** $459.48
- **Dataset scope:** 9,800 transaction rows, 793 unique customers, 1,861 unique products

## Category & Product Performance

- **Technology** is the top-performing category, generating **$827,455.87** — **36.59%** of total company sales, more than a third of all revenue from one category.
- **Phones** is the highest-selling sub-category ($327,782.45), which aligns with Technology's overall dominance.
- **Canon imageCLASS 2200 Advanced Copier** is the single highest-selling product by total sales ($61,599.82).

## Regional & Geographic Trends

- The **West** region leads all regions in total sales ($710,219.68).
- **California** is the top-performing state ($446,306.46), followed by New York and Texas — all three coastal, high-population states.

## Customer & Segment Behavior

- The **Consumer** segment generates the most revenue overall ($1,148,060.53), ahead of Corporate and Home Office segments.
- **Sean Miller** is the highest-spending individual customer, with $25,043.05 in total sales.

## Operations

- **Standard Class** is both the most-used and highest-revenue shipping mode ($1,340,831.31), suggesting most customers are not paying for expedited shipping.

## Data Quality Note

During the import process, 11 rows (all transactions from **Burlington, Vermont**) were initially dropped because their `Postal_Code` field was blank in the source data and the column was typed as an integer, which rejected the empty values. This was resolved by re-typing `Postal_Code` as `VARCHAR` and re-inserting the affected rows, bringing the dataset to its full 9,800 rows. This is a good example of why data type choices matter even for fields that look numeric (postal codes aren't used in arithmetic, so text is the safer type).
