USE healthcare_analytics;

-- LENGTH OF STAY (LOS)
-- How many days did each patient stay?

SELECT name,date_of_admission,discharge_date,
DATEDIFF(discharge_date,date_of_admission) AS length_of_stay
FROM healthcare_dataset_clean;


-- AVERAGE LENGTH OF STAY
-- What is the average patient stay?

SELECT ROUND(AVG(DATEDIFF(discharge_date,date_of_admission)),2) AS avg_length_of_stay
FROM healthcare_dataset_clean;


-- LONGEST LENGTH OF STAY
-- What is the longest patient stay?

SELECT MAX(DATEDIFF(discharge_date,date_of_admission)) AS longest_stay
FROM healthcare_dataset_clean;

-- SHORTEST LENGTH OF STAY

SELECT MIN(DATEDIFF(discharge_date,date_of_admission)) AS shortest_stay
FROM healthcare_dataset_clean;


-- LOS BY MEDICAL CONDITION
-- Which conditions have the longest stays?

SELECT medical_condition,ROUND(AVG(DATEDIFF(discharge_date,date_of_admission)),2) AS avg_los
FROM healthcare_dataset_clean
GROUP BY medical_condition
ORDER BY avg_los DESC;



-- LOS BY ADMISSION TYPE
-- Which admission type has the longest stay?

SELECT admission_type,ROUND(AVG(DATEDIFF(discharge_date,date_of_admission)),2) AS avg_los
FROM healthcare_dataset_clean
GROUP BY admission_type
ORDER BY avg_los DESC;


-- LOS BY AGE GROUP

SELECT CASE
WHEN age <= 18 THEN '0-18'
WHEN age BETWEEN 19 AND 35 THEN '19-35'
WHEN age BETWEEN 36 AND 55 THEN '36-55'
ELSE '56+'
END AS age_group,
ROUND(AVG(DATEDIFF(discharge_date,date_of_admission)),2) AS avg_los
FROM healthcare_dataset_clean
GROUP BY age_group
ORDER BY avg_los DESC;


-- MONTHLY ADMISSIONS
-- How many admissions occur each month?

SELECT YEAR(date_of_admission) AS admission_year,MONTH(date_of_admission) AS admission_month,COUNT(*) AS admissions
FROM healthcare_dataset_clean
GROUP BY YEAR(date_of_admission),MONTH(date_of_admission)
ORDER BY admission_year,admission_month;

-- MONTHLY REVENUE
-- How much revenue is generated each month?

SELECT YEAR(date_of_admission) AS admission_year,MONTH(date_of_admission) AS admission_month,ROUND(SUM(billing_amount),2) AS revenue
FROM healthcare_dataset_clean
GROUP BY YEAR(date_of_admission),MONTH(date_of_admission)
ORDER BY admission_year,admission_month;

-- YEARLY ADMISSIONS
SELECT YEAR(date_of_admission) AS admission_year,COUNT(*) AS admissions
FROM healthcare_dataset_clean
GROUP BY YEAR(date_of_admission)
ORDER BY admission_year;


-- YEARLY REVENUE
 SELECT YEAR(date_of_admission) AS admission_year,ROUND(SUM(billing_amount),2) AS revenue
FROM healthcare_dataset_clean
GROUP BY YEAR(date_of_admission)
ORDER BY admission_year;


-- ADMISSION TYPE DISTRIBUTION
SELECT admission_type,COUNT(*) AS patient_count
FROM healthcare_dataset_clean
GROUP BY admission_type
ORDER BY patient_count DESC; 


-- REVENUE BY ADMISSION TYPE
SELECT admission_type,ROUND(SUM(billing_amount),2) AS revenue
FROM healthcare_dataset_clean
GROUP BY admission_type
ORDER BY revenue DESC;


-- TOP 10 LONGEST STAYS

SELECT name,medical_condition,hospital,DATEDIFF(discharge_date,date_of_admission) AS length_of_stay
FROM healthcare_dataset_clean
ORDER BY length_of_stay DESC
LIMIT 10;