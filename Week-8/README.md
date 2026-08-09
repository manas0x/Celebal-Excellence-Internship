# Week 8 - E-Commerce Order Analytics System

Intern mini project. Skills tested: Python, SQL, Problem Solving.

## What this is

A company processes online orders and the raw data is messy. The notebook generates
sample data with intentional problems, cleans it, loads it into SQLite, and answers
business questions with SQL — including window functions, CTEs, and a self-join.

## Folder structure

```
Week-8/
├── data/                  raw generated CSVs
│   ├── customers.csv
│   ├── orders.csv
│   ├── order_items.csv
│   └── products.csv
├── output/                cleaned files + report
│   ├── orders_clean.csv
│   ├── products_clean.csv
│   └── cleaning_report.txt
├── ecommerce.db           SQLite db used for Part 3
├── Week8_Ecommerce_Assignment.ipynb
├── Week 8 Assignment.pdf
└── README.md
```

## How to run

```
pip install pandas numpy faker
```

Then just run the notebook top to bottom. Part 1 creates `data/`, Part 2 creates
`output/`, Part 3 builds `ecommerce.db` and runs the SQL queries.

## What's in each part

- **Part 1** — generates orders, order_items, products, customers (500+ rows each),
  with the required issues baked in: missing customer_id, negative quantity, wrong
  date format, messy product names, invalid emails.
- **Part 2** — `clean_orders()`, `clean_products()`, `validate_emails()`,
  `check_referential_integrity()`, and a short report of what was found.
- **Part 3** — loads the cleaned data into SQLite and runs all 16 required queries,
  basic through advanced (running totals, DENSE_RANK, LAG, NTILE, cohort analysis,
  products bought together).
- **Part 4** — a `generate_report()` function that takes a report type and date
  range and prints a summary (orders, revenue, customers, top 3 products).
- **Part 5** — edge case checks: orphan order_items, discount > 100, quantity = 0,
  future order dates.

## Notes

- `order_id` in `order_items.csv` is always sampled from real orders, so there are
  no orphan rows by default — Part 5's orphan test is really just confirming that.
- Dates come in two formats on purpose (`YYYY-MM-DD HH:MM:SS` and `DD-MM-YYYY
  HH:MM:SS`); `clean_orders()` handles both.
