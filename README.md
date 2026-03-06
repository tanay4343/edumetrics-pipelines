# EduMetrics Data Engineering Pipeline

## Project Overview

This project implements a data engineering pipeline for processing and analyzing school performance data. The pipeline performs data ingestion, transformation, validation, and analysis using PySpark and SQL.

The goal is to build a reliable analytics pipeline that ensures data quality, supports reporting, and demonstrates core data engineering practices.

---

## Technologies Used

- Apache Spark (PySpark)
- SQL
- Python
- Databricks
- Git & GitHub
- Parquet

---

## Project Architecture

The pipeline follows a standard ETL architecture.

Data Source (CSV)
→ Data Ingestion (PySpark)
→ Data Cleaning & Transformation
→ Data Quality Validation
→ Data Storage (Parquet)
→ SQL Analytics Layer

---

## Folder Structure
docs/
star_schema.png
pipeline_design.md
data_governance.md

sql/
data_model.sql
analysis_queries.sql

notebooks/
transform_school_data.py

tests/
data_quality_checks.py


---

## Data Pipeline Steps

1. **Data Ingestion**
   - Load CSV dataset using PySpark.

2. **Data Transformation**
   - Trim whitespace
   - Handle NULL values
   - Standardize text
   - Create derived columns

3. **Data Aggregation**
   - Average score by region
   - Top teachers by performance
   - Students examined by subject

4. **Data Quality Validation**
   - Null checks
   - Range validation
   - Date format validation
   - Duplicate detection

5. **Storage**
   - Clean dataset stored in Parquet/Delta format.

---

## Data Model

A **Star Schema** is used for analytics with:

Fact Table
- Fact_ExamResults

Dimension Tables
- Dim_School
- Dim_Teacher
- Dim_Subject
- Dim_Region
- Dim_Date

---

## SQL Analytics

The following analysis queries were implemented:

1. Average score by region
2. Top performing schools
3. Teacher performance ranking
4. Subject performance analysis
5. Regional pass rate comparison

---

## Data Governance

Data governance practices implemented:

- Data validation rules
- Data quality monitoring
- Data lineage documentation

No sensitive personally identifiable information (PII) exists in the dataset.

---
