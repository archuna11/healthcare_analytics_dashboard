
-- which conditions contribute the highest patient volume
SELECT medical_condition,COUNT(*) AS patient_count
FROM healthcare_dataset_clean
GROUP BY medical_condition
ORDER BY patient_count DESC;

-- Least common conditions
SELECT medical_condition,COUNT(*) AS patient_count
FROM healthcare_dataset_clean
GROUP BY medical_condition
ORDER BY patient_count ASC;

-- Condition by Gender
SELECT gender,medical_condition,COUNT(*) AS patient_count
FROM healthcare_dataset_clean
GROUP BY gender,medical_condition
ORDER BY patient_count DESC;

-- Condition by age group
SELECT CASE
WHEN age <= 18 THEN '0-18'
WHEN age BETWEEN 19 AND 35 THEN '19-35'
WHEN age BETWEEN 36 AND 55 THEN '36-55'
ELSE '56+'
END AS age_group,
medical_condition,
COUNT(*) AS patient_count
FROM healthcare_dataset_clean
GROUP BY age_group,medical_condition
ORDER BY patient_count DESC;

-- Most prescribed medications
SELECT medication,COUNT(*) AS prescription_count
FROM healthcare_dataset_clean
GROUP BY medication
ORDER BY prescription_count DESC;

-- Medication by condition
SELECT medical_condition,medication,COUNT(*) AS patient_count
FROM healthcare_dataset_clean
GROUP BY medical_condition,medication
ORDER BY patient_count DESC;

-- Test result distribution
SELECT test_results,COUNT(*) AS patient_count
FROM healthcare_dataset_clean
GROUP BY test_results
ORDER BY patient_count DESC;

-- Test results by condition
SELECT medical_condition,test_results,COUNT(*) AS patient_count
FROM healthcare_dataset_clean
GROUP BY medical_condition,test_results
ORDER BY patient_count DESC;

-- Condition revenue + Patient count
SELECT medical_condition,COUNT(*) AS patient_count,ROUND(SUM(billing_amount),2) AS revenue
FROM healthcare_dataset_clean
GROUP BY medical_condition
ORDER BY revenue DESC;