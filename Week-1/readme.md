# Week 1: Python Basics and Pandas Data Exploration

## Objective
Learn Python basics and perform basic data exploration and cleaning using Pandas.

## Dataset
- **Resource**: [Shopping Dataset](https://www.kaggle.com/datasets/anvitkumar/shopping-dataset)

## Steps Performed
1. **Load Data**: Loaded the CSV dataset into a Pandas DataFrame.
2. **Explore Data**: Explored the dataset using methods like `.head()`, `.tail()`, `.shape`, `.columns`, and `.dtypes`.
3. **Handle Missing Values**: Identified missing values and handled them appropriately (filled or dropped).
4. **Basic Operations**: Performed basic operations such as filtering specific rows and selecting relevant columns.
5. **Remove Duplicates**: Identified and removed any duplicate entries in the dataset.
6. **Create Derived Column**: Created a new derived column `total_amount` calculated as `price * quantity`.
7. **Save Cleaned Data**: Saved the final cleaned dataset as a new CSV file.

## Output Files
- `Week1.ipynb`: The Jupyter Notebook containing all the Python code for data exploration and cleaning.
- `cleaned_dataset.csv`: The final cleaned dataset after performing the above operations.

## Summary
This week's task focuses on foundational data science skills using Python and Pandas. The notebook demonstrates how to load raw data, inspect its structure, handle inconsistencies like missing or duplicate values, and perform basic feature engineering by creating a derived column. Finally, the processed data is exported to a new CSV file for future use.
