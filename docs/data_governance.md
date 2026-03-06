# Data Governance and Quality

## 1. What is Data Governance?

Data governance is the framework of policies, standards, and processes that ensure data is accurate, secure, consistent, and properly managed across an organization.

It defines how data is collected, stored, processed, accessed, and protected throughout the data lifecycle.

Key goals:
- Ensure data quality
- Maintain data security
- Enforce compliance
- Enable trusted analytics

---

## 2. Is there any PII in this dataset?

The dataset used in this pipeline contains educational performance data.

Columns include:
- school_name
- teacher_name
- subject
- avg_score
- pass_rate
- exam_date

This dataset does **not contain sensitive Personally Identifiable Information (PII)** such as:
- phone numbers
- addresses
- national IDs
- emails

Teacher names could be considered **low-risk personal data**, but it is not sensitive PII.

---

## 3. Data Lineage in the Pipeline

The data lineage describes how data flows through the pipeline.

Source Layer
→ CSV dataset (school_performance.csv)

Ingestion Layer
→ PySpark reads the CSV file into a DataFrame

Transformation Layer
→ Data cleaning
→ NULL handling
→ Data type casting
→ Feature creation (performance_band)

Data Quality Layer
→ Validation rules executed using data_quality_checks.py

Storage Layer
→ Clean dataset stored in Parquet

Analytics Layer
→ SQL queries for analysis and reporting

---

## 4. Industry Data Governance Tools

Two commonly used industry tools are:

1. Apache Atlas  
   Used for data governance, metadata management, and data lineage tracking in big data environments.

2. Microsoft Purview  
   A cloud-based data governance solution used for data cataloging, compliance, and lineage tracking across enterprise data systems.
