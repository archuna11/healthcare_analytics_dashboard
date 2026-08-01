

USE healthcare_analytics;

-- TOTAL REVENUE

-- total revenue generated

SELECT ROUND(SUM(billing_amount),2) AS total_revenue
FROM healthcare_dataset_clean;

-- AVERAGE BILLING AMOUNT
-- average bill per patient

SELECT ROUND(AVG(billing_amount),2) AS avg_billing_amount
FROM healthcare_dataset_clean;

-- REVENUE BY MEDICAL CONDITION
-- conditions generated the most revenue

SELECT medical_condition, ROUND(SUM(billing_amount),2) AS revenue
FROM healthcare_dataset_clean
GROUP BY medical_condition
ORDER BY revenue DESC;



-- REVENUE + PATIENT COUNT BY CONDITION
 -- Is revenue driven by volume or billing amount?

SELECT medical_condition,COUNT(*) AS patient_count,ROUND(SUM(billing_amount),2) AS revenue
FROM healthcare_dataset_clean
GROUP BY medical_condition
ORDER BY revenue DESC;


-- REVENUE PER PATIENT BY CONDITION
-- Which condition generates the highest revenue per patient?

SELECT medical_condition,ROUND(SUM(billing_amount),2) AS revenue,COUNT(*) AS patient_count,
ROUND(SUM(billing_amount)/COUNT(*),2) AS revenue_per_patient
FROM healthcare_dataset_clean
GROUP BY medical_condition
ORDER BY revenue_per_patient DESC;


-- REVENUE BY INSURANCE PROVIDER
-- Which insurance providers generate the highest revenue?

SELECT insurance_provider,ROUND(SUM(billing_amount),2) AS revenue
FROM healthcare_dataset_clean
GROUP BY insurance_provider
ORDER BY revenue DESC;


-- PATIENTS BY INSURANCE PROVIDER
-- Which providers cover the largest number of patients?

SELECT insurance_provider,COUNT(*) AS patient_count
FROM healthcare_dataset_clean
GROUP BY insurance_provider
ORDER BY patient_count DESC;


-- REVENUE PER PATIENT BY PROVIDER
-- Which provider generates the highest revenue per patient?

SELECT insurance_provider,ROUND(SUM(billing_amount),2) AS revenue,COUNT(*) AS patient_count,
ROUND(SUM(billing_amount)/COUNT(*),2) AS revenue_per_patient
FROM healthcare_dataset_clean
GROUP BY insurance_provider
ORDER BY revenue_per_patient DESC;

-- REVENUE BY HOSPITAL
-- Which hospitals generate the most revenue?

SELECT hospital,ROUND(SUM(billing_amount),2) AS revenue
FROM healthcare_dataset_clean
GROUP BY hospital
ORDER BY revenue DESC;


-- TOP 10 HOSPITALS BY REVENUE

SELECT hospital,ROUND(SUM(billing_amount),2) AS revenue
FROM healthcare_dataset_clean
GROUP BY hospital
ORDER BY revenue DESC
LIMIT 10;


-- REVENUE BY DOCTOR
-- Which doctors generate the most revenue?

SELECT doctor,ROUND(SUM(billing_amount),2) AS revenue
FROM healthcare_dataset_clean
GROUP BY doctor
ORDER BY revenue DESC;


-- TOP 10 DOCTORS BY REVENUE

SELECT doctor,ROUND(SUM(billing_amount),2) AS revenue
FROM healthcare_dataset_clean
GROUP BY doctor
ORDER BY revenue DESC
LIMIT 10;


-- REVENUE BY ADMISSION TYPE
-- Which admission type contributes the most revenue?

SELECT admission_type,ROUND(SUM(billing_amount),2) AS revenue
FROM healthcare_dataset_clean
GROUP BY admission_type
ORDER BY revenue DESC;

-- AVERAGE BILLING BY ADMISSION TYPE
 

SELECT admission_type,ROUND(AVG(billing_amount),2) AS avg_bill
FROM healthcare_dataset_clean
GROUP BY admission_type
ORDER BY avg_bill DESC;


-- REVENUE BY AGE GROUP
-- Which age group contributes the most revenue?

SELECT CASE
WHEN age <= 18 THEN '0-18'
WHEN age BETWEEN 19 AND 35 THEN '19-35'
WHEN age BETWEEN 36 AND 55 THEN '36-55'
ELSE '56+'
END AS age_group,
ROUND(SUM(billing_amount),2) AS revenue
FROM healthcare_dataset_clean
GROUP BY age_group
ORDER BY revenue DESC;


-- AVERAGE BILLING BY AGE GROUP

SELECT CASE
WHEN age <= 18 THEN '0-18'
WHEN age BETWEEN 19 AND 35 THEN '19-35'
WHEN age BETWEEN 36 AND 55 THEN '36-55'
ELSE '56+'
END AS age_group,
ROUND(AVG(billing_amount),2) AS avg_bill
FROM healthcare_dataset_clean
GROUP BY age_group
ORDER BY avg_bill DESC;