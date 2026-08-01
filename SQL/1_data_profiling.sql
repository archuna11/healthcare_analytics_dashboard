-- Total patients
SELECT COUNT(*) AS total_patients
FROM healthcare_dataset;

-- Data coverage period
SELECT MIN(date_of_admission) AS first_admission, MAX(date_of_admission) AS last_admission
FROM healthcare_dataset;

-- Number of Hospitals
SELECT COUNT(DISTINCT hospital) AS total_hospitals
FROM healthcare_dataset;

-- Number of doctors
SELECT COUNT(DISTINCT doctor) AS total_doctors
FROM healthcare_dataset;

-- Number of Insurance Providers
SELECT COUNT(DISTINCT insurance_provider) AS total_providers
FROM healthcare_dataset;

-- Number of Medical conditions
SELECT COUNT(DISTINCT medical_condition) AS total_conditions
FROM healthcare_dataset;

-- Number of medications
SELECT COUNT(DISTINCT medication) AS total_medications
FROM healthcare_dataset;

-- Gender distribution
SELECT gender,COUNT(*) AS patient_count
FROM healthcare_dataset
GROUP BY gender;

-- Admission type distribution
SELECT admission_type,COUNT(*) AS patient_count
FROM healthcare_dataset
GROUP BY admission_type
ORDER BY patient_count DESC;


-- Test Results patient distribution
SELECT test_results,COUNT(*) AS patient_count
FROM healthcare_dataset
GROUP BY test_results
ORDER BY patient_count DESC;