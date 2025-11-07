-- 1. Count the total number of patients in the hospital.
SELECT COUNT(*) AS total_patients FROM patients;


-- 2. Calculate the average satisfaction score of all patients.
SELECT AVG(satisfaction) AS avg_satisfaction_score FROM patients;


-- 3. Find the minimum and maximum age of patients.
SELECT MIN(age) AS min_age, MAX(age) AS max_age FROM patients;
