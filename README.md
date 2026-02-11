# Hospital Readmission Risk Analysis (SQL Project)
## Overview

This project analyzes over 100,000 hospital encounters from the Diabetes 130-US Hospitals dataset to identify the drivers of 30-day patient readmissions.

Hospital readmissions are a major operational and financial challenge for healthcare systems. The goal of this analysis was to move beyond descriptive reporting and instead identify actionable patient segments that could be targeted for intervention to reduce readmissions.

All analysis was performed using SQL in a relational database environment (SQLite via DBeaver), simulating a real analytics workflow used by healthcare data teams.

---------------------------------------------------------------------------------------------------
## Business Problem

Hospitals face penalties and increased costs when patients are readmitted shortly after discharge. However, system-wide interventions are expensive and inefficient.

The key question:

Can we identify a small group of patients responsible for a disproportionate number of readmissions and target them with focused care management?
---------------------------------------------------------------------------------------------------
Dataset

- Source: Kaggle – Diabetes 130-US Hospitals Dataset

- Records: ~101,000 hospital encounters

- Unit of analysis: individual hospital visits (not patients)

Key variables used:

- prior hospitalizations

- ER visits

- medications

- lab procedures

- length of stay

- readmission status (<30 days)

--------------------------------------------------------------------------------------------------

Methodology

The analysis followed a structured analytics workflow:

- Data ingestion and cleaning

- Creation of an analysis-ready encounter table

- Baseline readmission rate calculation

- Cohort analysis by prior hospitalization history

- Risk segmentation (Low / Moderate / High)

- Behavioral driver analysis using ER utilization

Key SQL techniques:

- CASE segmentation

- aggregation & cohort analysis

- rate calculations

- derived risk classification

- subqueries

--------------------------------------------------------------------------------------------------

Key Findings

Overall 30-day readmission rate: ~11%

Patients with 3+ prior admissions represented only ~7% of the population

This group accounted for ~16% of all readmissions

High-risk patients averaged ~10× more ER visits than low-risk patients

Interpretation:
Readmissions were less associated with inpatient treatment intensity and more associated with post-discharge care behavior, particularly emergency department utilization.

--------------------------------------------------------------------------------------------------
Recommendation

A targeted intervention program focused on repeat patients (care coordination, follow-up scheduling, and outreach) could significantly reduce readmissions without requiring hospital-wide operational changes.

Estimated impact:
Focusing on ~7% of high-risk patients could potentially address ~16% of readmissions.


