# About this folder

Drop your own screenshots into the matching subfolder below as you run `../delta_scd_assignment.ipynb` in a local Jupyter install (Jupyter Notebook, JupyterLab, or VS Code's notebook viewer).

You don't need to screenshot every single cell — one screenshot per checkpoint below is enough:

- **data_loading/** → the "1. Load dataset into a Delta table" section (raw data + shape)
- **data_cleaning/** → the "2. Basic cleaning" section (nulls identified, then the "after cleaning" result)
- **scd1/** → the "4. Apply MERGE operation" section (the upsert itself, "MERGE complete" output)
- **scd2/** → the transaction history output (`dt.history()`) showing the versioned MERGE commit
- **validation/** → the "5. Validate results" section (row-count check, duplicate check, before/after spot-checks)
- **final_output/** → the "6. Display the final dataset and summary" section
