USE hospitals;
SELECT * FROM patients;

SELECT service, COUNT(*) AS patient_count
FROM patients
GROUP BY service
HAVING COUNT(*) > 100;

SELECT service,
    COUNT(*) AS total_patients,
    AVG(age) AS avg_age,
    AVG(satisfaction) AS avg_satisfaction
FROM patients
GROUP BY service
ORDER BY total_patients DESC;


SELECT service,
    CASE WHEN age >= 65 THEN 'Senior' ELSE 'Adult' END AS age_group,
    COUNT(*) AS countFROM patients
GROUP BY service, age_group;

