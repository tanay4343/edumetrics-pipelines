# EduMetrics School Performance Data Pipeline Design

## Overview
This document describes the design of the EduMetrics School Performance Data Pipeline. The purpose of the pipeline is to process raw school performance data and transform it into a clean, structured dataset suitable for analytics and reporting.

The pipeline ingests raw exam data from a CSV dataset, applies several data cleaning and transformation steps using PySpark, and then stores the processed data in an optimized format for querying and analysis.

This pipeline ensures that the data is consistent, validated, and ready for downstream analytics tasks such as SQL queries and reporting.

---

## Pipeline Architecture
The pipeline follows an **ETL (Extract, Transform, Load)** architecture.

### Extract
Raw data is extracted from a CSV dataset containing school exam performance information.

### Transform
The extracted data is cleaned and transformed using PySpark. This includes handling missing values, standardizing text fields, and creating derived columns.

### Load
After transformation, the processed data is stored in a structured storage format such as Parquet or Delta Lake for efficient querying and analytics.

### Architecture Flow
Raw CSV Data
↓
Data Extraction
↓
Data Transformation (PySpark)
↓
Clean Structured Dataset
↓
Analytics and Reporting


---

## Data Ingestion
The source data for the pipeline is provided as a CSV file named:

school_performance.csv

This dataset contains information about:
- Schools
- Teachers
- Subjects
- Grade levels
- Student counts
- Average scores
- Pass rates
- Exam dates

The raw dataset is stored in the project directory:

data/raw/school_performance.csv

PySpark reads this file and loads it into a Spark DataFrame for processing.

---

## Data Transformation
The pipeline performs several transformations to ensure data quality and consistency.

### Data Cleaning
- Remove leading and trailing whitespace from text fields such as `teacher_name` and `school_name`
- Standardize school names by converting them to uppercase

### Handling Missing Values
- Replace NULL values in the `avg_score` column using the average score of the corresponding subject.

### Data Type Conversion
- Convert numeric fields such as `avg_score`, `pass_rate`, and `num_students` into appropriate numeric data types.

### Derived Column Creation
A new column called **performance_band** is created to categorize school performance based on the average score.

| Score Range | Performance Band |
|-------------|------------------|
| >= 80       | High             |
| >= 60       | Medium           |
| < 60        | Low              |

This classification helps categorize performance levels across schools.

---

## Data Storage (Loading)
After transformation, the cleaned dataset is stored in a structured storage location.

Example output location:

/mnt/outputs/school_performance_clean

The dataset is stored in one of the following formats:

- Parquet

These formats provide:
- Faster query performance
- Efficient storage
- Compatibility with Spark and SQL analytics systems

---

## Scheduling
The pipeline is designed to run as a **batch processing job**.

A scheduler such as the following can be used:

- Databricks Jobs
- Apache Airflow
- Cron Jobs

The pipeline can run **daily** to process newly added exam data and keep analytics datasets updated.

---

## Error Handling and Monitoring
To ensure reliability, the pipeline includes basic monitoring and error handling mechanisms.

Key strategies include:
- Logging errors during pipeline execution
- Retrying failed jobs
- Running data quality validation checks
- Generating alerts if pipeline execution fails

These mechanisms help ensure that only valid and clean data is stored in the final dataset.

---

## Pipeline Flow Diagram
Raw CSV Dataset
↓
Data Ingestion (Spark Read)
↓
Data Cleaning and Transformation (PySpark)
↓
Data Validation and Quality Checks
↓
Storage in Parquet Table
↓
SQL Analytics and Reporting


---

## Technologies Used

| Technology | Purpose |
|-----------|--------|
| Python | Programming language |
| PySpark | Data processing and transformation |
| SQL | Data analysis |
| Databricks | Data engineering platform |
| Parquet | Data storage format |
| Git & GitHub | Version control and project management |

---

## Benefits of the Pipeline
This pipeline provides several advantages:

- Ensures clean and validated data
- Supports scalable processing using Spark
- Enables efficient SQL analytics
- Maintains high data quality through validation checks
- Provides a structured workflow for data engineering tasks

The design follows modern data engineering practices used in large-scale data platforms.
