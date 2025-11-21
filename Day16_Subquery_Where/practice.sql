-- Patients in services with high average satisfaction
SELECT * FROM patients
WHERE service IN (
    SELECT service
    FROM services_weekly
    GROUP BY service
    HAVING AVG(patient_satisfaction) > 80);
    
-- Patients older than the average age
SELECT name, age
FROM patients
WHERE age > (
    SELECT AVG(age)
    FROM patients
);
-- Services that had any week with refusals
SELECT DISTINCT service
FROM services_weekly sw1
WHERE EXISTS (
    SELECT 1    FROM services_weekly sw2
    WHERE sw2.service = sw1.service
    AND sw2.patients_refused > 0);
    
-- Patients NOT in services with staff shortages
SELECT *FROM patients
WHERE service NOT IN (
    SELECT service
    FROM staff
    GROUP BY service
    HAVING COUNT(*) < 5);