-- 1. Count the number of patients by each service.
SELECT service, COUNT(*) AS patient_cnt FROM patients GROUP BY service;

-- 2. Calculate the average age of patients grouped by service.
SELECT service, ROUND(AVG(age)) AS avg_age FROM patients GROUP BY service;

-- 3. Find the total number of staff members per role.
SELECT role, COUNT(*) AS patient_cnt FROM staff GROUP BY role;

