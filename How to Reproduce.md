## How to Reproduce
1. Download the Kaggle Diabetes 130-US Hospitals dataset (CSV).
2. Import CSV into SQLite as `encounters_raw` (DBeaver).
3. Run scripts in order:
   - sql/01_create_table.sql
   - sql/02_readmission_rate.sql
   - sql/03_risk_segmentation.sql
   - sql/04_driver_analysis.sql
