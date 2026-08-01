
USE healthcare_analytics;

-- GENDER DISTRIBUTION

-- What is the gender distribution of patients?

SELECT gender,COUNT(*) AS patient_count
FROM healthcare_dataset_clean
GROUP BY gender;



-- GENDER PERCENTAGE
-- What percentage of patients are male and female?

SELECT gender,COUNT(*) AS patient_count,ROUND(COUNT(*) * 100.0 /(SELECT COUNT(*) FROM healthcare_dataset_clean),2) AS percentage
FROM healthcare_dataset_clean
GROUP BY gender;


-- AGE STATISTICS
 -- What is the average, minimum and maximum age?

SELECT ROUND(AVG(age),2) AS average_age,MIN(age) AS youngest_patient,MAX(age) AS oldest_patient
FROM healthcare_dataset_clean;

-- AGE GROUP DISTRIBUTION
 -- Which age groups contribute the most patients?

SELECT CASE
WHEN age <= 18 THEN '0-18'
WHEN age BETWEEN 19 AND 35 THEN '19-35'
WHEN age BETWEEN 36 AND 55 THEN '36-55'
ELSE '56+'
END AS age_group,
COUNT(*) AS patient_count
FROM healthcare_dataset_clean
GROUP BY age_group
ORDER BY patient_count DESC;


-- AGE GROUP REVENUE
-- Which age group contributes the most revenue?

SELECT CASE
WHEN age <= 18 THEN '0-18'
WHEN age BETWEEN 19 AND 35 THEN '19-35'
WHEN age BETWEEN 36 AND 55 THEN '36-55'
ELSE '56+'
END AS age_group,
ROUND(SUM(billing_amount),2) AS total_revenue
FROM healthcare_dataset_clean
GROUP BY age_group
ORDER BY total_revenue DESC;


-- AGE GROUP AVERAGE BILLING
 -- Which age group has the highest average billing amount?

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


-- BLOOD TYPE DISTRIBUTION
 -- What is the distribution of blood types?

SELECT blood_type,COUNT(*) AS patient_count FROM healthcare_dataset_clean
GROUP BY blood_type
ORDER BY patient_count DESC;



-- MOST COMMON BLOOD TYPE
-- Which blood type is most common?

SELECT blood_type,COUNT(*) AS patient_count FROM healthcare_dataset_clean
GROUP BY blood_type
ORDER BY patient_count DESC
LIMIT 1;


-- PATIENTS BY INSURANCE PROVIDER
-- Which insurance provider covers the most patients?

SELECT insurance_provider,COUNT(*) AS patient_count FROM healthcare_dataset_clean
GROUP BY insurance_provider
ORDER BY patient_count DESC;



-- PATIENTS BY ADMISSION TYPE
-- Which admission type is most common?

SELECT admission_type,COUNT(*) AS patient_count FROM healthcare_dataset_clean
GROUP BY admission_type
ORDER BY patient_count DESC;