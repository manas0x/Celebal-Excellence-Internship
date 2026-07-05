# Week 3 - SQL Data Analysis using Superstore Dataset

## Objective

Analyze the Superstore dataset using SQL by applying:

- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- JOIN Operations

---

## Workflow

```text
KaggleHub Dataset
        │
        ▼
Python Notebook
        │
        ├── Download dataset from KaggleHub
        ├── Save dataset to local working directory
        ├── Convert dataset encoding to UTF-8
        ├── Load dataset using Pandas
        └── Export dataset to MySQL
                │
                ▼
        superstore_raw
                │
                ▼
        db.sql
                │
                ├── Create customers table
                ├── Create products table
                ├── Create orders table
                └── Populate tables from superstore_raw
                │
                ▼
        step2.sql
                │
                ├── Subqueries
                ├── CTEs
                ├── Window Functions
                └── Required SQL Queries
                │
                ▼
        step3.sql
                │
                └── Final Combined Query
                       (JOIN + CTE + Window Function)
                │
                ▼
        mini_project.sql
                │
                ├── Top 5 Customers
                ├── Bottom 5 Customers
                ├── Single Order Customers
                ├── Above Average Customers
                └── Highest Order Value per Customer
```

---

# Folder Structure

```text
Week-3/
│
├── README.md
├── week3_setup.ipynb
├── sql/
│   ├── db.sql
│   ├── step2.sql
│   ├── step3.sql
│   └── mini_project.sql
├── Sample-Superstore-UTF8.csv
├── week3_task.pdf
├── CELEBAL INTERNSHIP ASSIGNMENT 3.pdf
```

---

# File Description

### [`week3_setup.ipynb`](./week3_setup.ipynb)

Python notebook used to prepare the dataset before SQL analysis.

Tasks performed:

- Downloaded the Superstore dataset using KaggleHub.
- Saved the dataset to the local working directory.
- Converted the dataset encoding to UTF-8.
- Loaded the dataset using Pandas.
- Exported the dataset into MySQL as `superstore_raw`.

---

### [`db.sql`](./sql/db.sql)

Database setup script.

- Create database.
- Create `customers`, `products`, and `orders` tables.
- Populate all tables from `superstore_raw`.

---

### [`step2.sql`](./sql/step2.sql)

Contains all required SQL queries for Week 3.

- Subqueries
- CTEs
- Window Functions
- Ranking
- Partition By

---

### [`step3.sql`](./sql/step3.sql)

Final combined SQL query using:

- JOIN
- CTE
- Window Function

Displays:

- Customer Name
- Total Sales
- Customer Rank

---

### [`mini_project.sql`](./sql/mini_project.sql)

Business insights queries.

- Top 5 Customers
- Bottom 5 Customers
- Customers with only one order
- Customers with above-average sales
- Highest order value per customer

---

### [`week3_task.pdf`](./week3_task.pdf) & [`CELEBAL INTERNSHIP ASSIGNMENT 3.pdf`](./CELEBAL%20INTERNSHIP%20ASSIGNMENT%203.pdf)

Assignment instructions and reports.

---

## Technologies Used

- Python
- Pandas
- KaggleHub
- SQLAlchemy
- MySQL
- MySQL Workbench
- Jupyter Notebook

---

## Dataset

**Superstore Dataset** downloaded using KaggleHub and prepared using Python before importing into MySQL.

---

## Learning Outcome

- Import datasets into MySQL using Python.
- Prepare data for SQL analysis.
- Apply Subqueries for analytical queries.
- Use Common Table Expressions (CTEs).
- Perform ranking using Window Functions.
- Combine JOIN, CTE, and Window Functions to solve business problems.
- Generate customer sales insights using SQL.
