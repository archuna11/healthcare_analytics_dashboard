
USE healthcare_analytics;

-- CHECK FOR MISSING VALUES
-- Missing Age Values

SELECT COUNT(*) AS missing_age
FROM healthcare_dataset
WHERE age IS NULL;


-- Missing Billing Amount

SELECT COUNT(*) AS missing_billing
FROM healthcare_dataset
WHERE billing_amount IS NULL;


-- Missing Medical Condition

SELECT COUNT(*) AS missing_condition
FROM healthcare_dataset
WHERE medical_condition IS NULL;


-- Missing Insurance Provider

SELECT COUNT(*) AS missing_provider
FROM healthcare_dataset
WHERE insurance_provider IS NULL;


-- Missing Hospital

SELECT COUNT(*) AS missing_hospital
FROM healthcare_dataset
WHERE hospital IS NULL;


-- CHECK FOR DUPLICATE RECORDS

-- Potential duplicate patients
-- Same patient name and admission date

SELECT name,date_of_admission,COUNT(*) AS duplicate_count
FROM healthcare_dataset
GROUP BY name,date_of_admission
HAVING COUNT(*) > 1;


-- Investigate a duplicate record

SELECT * FROM healthcare_dataset
WHERE name = 'Adrienne Bell'
AND date_of_admission = '2022-09-19';


-- COUNT TOTAL VS UNIQUE RECORDS
 

-- Total Records

SELECT COUNT(*) AS total_rows
FROM healthcare_dataset;


-- Unique Records

SELECT COUNT(*) AS unique_rows
FROM
(SELECT DISTINCT * FROM healthcare_dataset
) t;


-- CREATE BACKUP TABLE
 

CREATE TABLE healthcare_dataset_backup AS
SELECT *
FROM healthcare_dataset;


-- CREATE CLEAN TABLE

CREATE TABLE healthcare_dataset_clean AS
SELECT DISTINCT *
FROM healthcare_dataset;


-- DATA VALIDATION

-- Age Range Validation

SELECT MIN(age) AS minimum_age,MAX(age) AS maximum_age,AVG(age) AS average_age
FROM healthcare_dataset_clean;


-- Billing Amount Validation

SELECT MIN(billing_amount) AS minimum_bill,MAX(billing_amount) AS maximum_bill,AVG(billing_amount) AS average_bill
FROM healthcare_dataset_clean;


-- CHECK DISTINCT CATEGORICAL VALUES

-- Gender Values

SELECT DISTINCT gender
FROM healthcare_dataset_clean;


-- Admission Type Values

SELECT DISTINCT admission_type
FROM healthcare_dataset_clean;


-- Test Result Values

SELECT DISTINCT test_results
FROM healthcare_dataset_clean;


-- Blood Types

SELECT DISTINCT blood_type
FROM healthcare_dataset_clean;


-- VERIFY CLEAN TABLE RECORD COUNT

SELECT COUNT(*) AS cleaned_records
FROM healthcare_dataset_clean;