# Week 7 — Delta Lake MERGE Implementation

**Objective:** Perform incremental data processing (upsert) using Delta Lake.

## Folder Structure

```
Week-7/
│
├── delta_scd_assignment.ipynb     # main notebook — load, clean, MERGE, validate (the graded artifact)
│
├── Dataset/
│   ├── customer_master.csv        # base/initial dataset (with intentional nulls + duplicates)
│   └── customer_incremental.csv   # simulated incremental feed (updates + new customers)
│
├── screenshots/
│   ├── data_loading/
│   ├── data_cleaning/
│   ├── scd1/
│   ├── scd2/
│   ├── validation/
│   ├── final_output/
│   └── README.md                  # explains what to screenshot in each subfolder
│
└── README.md
```

## What this project does

1. **Load** `Dataset/customer_master.csv` (210 rows, with intentional nulls and 10 duplicate rows) and inspect it.
2. **Clean** the data:
   - Missing `email` → regenerated from `customer_name`
   - Missing `city` → filled with `"Unknown"`
   - Missing `lifetime_value` → filled with the column median
   - 10 exact duplicate rows dropped → 200 clean rows
3. Write the cleaned data as the **base Delta table** (`customer_delta_table`, version 0), created inside this folder when the notebook runs.
4. **Simulate an incremental feed** (`Dataset/customer_incremental.csv`, 55 rows): 30 records that update existing customers (refreshed `total_orders` / `lifetime_value`) and 25 brand-new customers.
5. **MERGE** the incremental feed into the Delta table:
   - `when_matched_update_all()` → refresh existing customer rows
   - `when_not_matched_insert_all()` → append brand-new customers
6. **Validate**: row counts before/after, zero duplicate `customer_id`s after merge, and a spot-check of an updated and a newly-inserted record.
7. **Display** the final merged dataset and a run summary, plus the Delta transaction log (`dt.history()`), which shows the MERGE operation and its row-level metrics (30 updated, 25 inserted, 225 final rows).

## Engine note

The notebook uses the [`deltalake`](https://pypi.org/project/deltalake/) Python package (`delta-rs`, the Rust-native Delta Lake engine) rather than PySpark + `delta-spark`. Both read/write the same open Delta Lake table format and transaction log, and both expose an equivalent `MERGE` API. `delta-rs` was used here because it runs standalone — no JVM, no Maven/Ivy dependency resolution required — while producing the identical `MERGE`/upsert result the assignment asks for.

## How to run

```bash
pip install pandas numpy deltalake jupyter
jupyter nbconvert --to notebook --execute --inplace delta_scd_assignment.ipynb
```

This will (re)create a `customer_delta_table/` folder alongside the notebook, containing the actual Delta table and its `_delta_log/` transaction log.

## Results Summary

| Metric | Value |
|---|---|
| Rows loaded (raw master) | 210 |
| Duplicate rows removed | 10 |
| Rows in cleaned base Delta table | 200 |
| Rows in incremental feed | 55 |
| Existing customers updated | 30 |
| New customers inserted | 25 |
| Final Delta table row count | 225 (200 + 25, verified) |
| Duplicate `customer_id`s after MERGE | 0 |
| Delta table version after MERGE | 1 |
