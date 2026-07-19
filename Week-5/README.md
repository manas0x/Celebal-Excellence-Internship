# ⚡ Apache Spark – Data Cleaning, Transformation & Aggregation using DataFrames

### Week-05 | Data Engineer Internship | Celebal Technologies

[![Python](https://img.shields.io/badge/Python-3.12-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![PySpark](https://img.shields.io/badge/Apache%20Spark-PySpark-E25A1C?style=for-the-badge&logo=apachespark&logoColor=white)](https://spark.apache.org/)
[![Java](https://img.shields.io/badge/Java-17%20LTS-007396?style=for-the-badge&logo=openjdk&logoColor=white)](https://adoptium.net/)
[![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-F37626?style=for-the-badge&logo=jupyter&logoColor=white)](https://jupyter.org/)
[![License](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)](#)

</div>

---

## 📌 Project Overview

This repository contains the Week-05 assignment for the **Celebal Technologies Data Engineering Internship**, focused on building practical skills with **Apache Spark DataFrames**. It covers Spark fundamentals, the limitations of MapReduce, and a complete hands-on pipeline — from raw data ingestion to a cleaned, aggregated, schema-corrected final output.

The dataset used is the **[Retail Analysis Large Dataset](https://www.kaggle.com/datasets/sahilprajapati143/retail-analysis-large-dataset)** from Kaggle.

---

## 🎯 Objectives

- Spark fundamentals and architecture
- Limitations of traditional MapReduce
- In-memory computing and why it makes Spark faster
- Spark DataFrame concepts and immutability
- Data cleaning (duplicates, null handling)
- Filtering conditions (age, category, region)
- Aggregation and grouping operations
- Shuffle / wide transformations
- Schema modification (casting, renaming)
- End-to-end Spark data processing pipeline

---

## 🛠️ Technology Stack

| Category | Tools |
|---|---|
| **Language** | Python 3.12 |
| **Processing Engine** | Apache Spark (PySpark) |
| **Runtime** | Java 17 (Temurin JDK) |
| **Development** | Jupyter Notebook |
| **Data Handling** | Pandas |
| **Version Control** | Git & GitHub |

---

## 🗂️ Dataset Information

| Detail | Description |
|---|---|
| **File** | [`retail_data.csv`](DataSet/retail_data.csv) |
| **Source** | [Kaggle - Retail Analysis Large Dataset](https://www.kaggle.com/datasets/sahilprajapati143/retail-analysis-large-dataset) |
| **Format** | CSV, header row present |

**Columns:**

`Transaction_ID` · `Customer_ID` · `Name` · `Email` · `Phone` · `Address` · `City` · `State` · `Zipcode` · `Country` · `Age` · `Gender` · `Income` · `Customer_Segment` · `Date` · `Year` · `Month` · `Time` · `Total_Purchases` · `Amount` · `Total_Amount` · `Product_Category` · `Product_Brand` · `Product_Type` · `Feedback` · `Shipping_Method` · `Payment_Method` · `Order_Status` · `Ratings`

Since the dataset's real column names don't match the wording used in the assignment questions, this mapping is used throughout the notebook:

| Assignment term | Actual column |
|---|---|
| user_id | `Customer_ID` |
| transaction_date | `Date` |
| region | `Country` |
| product_category | `Product_Category` |
| sale_amount | `Total_Amount` |
| price | `Amount` |
| subscription | `Customer_Segment` |
| status | `Order_Status` |
| store_id | `City` |
| username | `Name` |

---

## 📝 Assignment Questions Covered

| # | Topic |
|---|---|
| Q1 | MapReduce limitations |
| Q2 | In-memory computing |
| Q3 | Remove duplicates |
| Q4 | Filter and aggregate sales data |
| Q5 | Handle null values (`.na.drop()` vs `.na.fill()`) |
| Q6 | Count records by city |
| Q7 | DataFrame immutability |
| Q8 | Age and subscription filtering |
| Q9 | Handling nulls before aggregation |
| Q10 | Schema modification and timestamp conversion |
| Q11 | Shuffle operations |
| Q12 | Remove invalid records (null email / empty username) |
| Q13 | Multiple aggregations using `.agg()` |
| Q14 | Risks of `inferSchema=true` |
| Q15 | End-to-end processing pipeline |

---

## 🔁 Processing Pipeline

```
1.  Create Spark Session
2.  Load dataset
3.  Explore dataset (show, printSchema, describe)
4.  Remove duplicates
5.  Handle null values
6.  Apply filtering conditions
7.  Perform aggregations
8.  Group data
9.  Modify schema (cast + rename)
10. Build final processing pipeline
11. Save processed output
```

---

## 📎 Assignment Files

| File | Description |
|---|---|
| [Notebook](notebook/week5_spark_assignment.ipynb) | Full PySpark solution — all 15 questions |
| [Dataset](DataSet/retail_data.csv) | Retail Analysis Large Dataset (CSV) |
| [Assignment Questions (PDF)](docs/Week5_Questions.pdf) | Original questions document |
| [Week 5 Assessment (PDF)](docs/Week5_Assessment.pdf) | Week 5 assessment document |
| [Cleaned Output](output/cleaned_dataset.csv) | Dataset after cleaning + aggregation |

> File names above assume the folder structure below. Rename the paths in this README if your actual file names differ.

---

## 📁 Folder Structure

```
Week-05-Spark-DataFrame-Processing/
│
├── DataSet/
│   └── retail_data.csv
│
├── notebook/
│   └── week5_spark_assignment.ipynb
│
├── docs/
│   ├── Week5_Questions.pdf
│   └── Week5_Assessment.pdf
│
├── output/
│   └── cleaned_dataset.csv
│
└── README.md
```

---

## 💡 Key Learnings

- ⚡ Spark is faster than MapReduce because of **in-memory processing**.
- 🔒 Spark DataFrames are **immutable** — every transformation returns a new DataFrame.
- 🧹 Data cleaning should always be performed **before** aggregations.
- 🔀 `groupBy()` operations trigger a **shuffle** across partitions.
- 🧬 Inconsistent date formats break `inferSchema` — explicit parsing (`to_timestamp`) is safer.
- 🏗️ Building an **end-to-end pipeline** ties cleaning and aggregation into one reusable flow.

---

<div align="center">

**Week-05 Assignment · Celebal Technologies Data Engineering Internship**

</div>