-- Combine patient and staff names
SELECT name AS full_name, 'Patient' AS type, service FROM patients 
UNION ALL
SELECT staff_name AS full_name, 'Staff' AS type, service FROM staff
ORDER BY service, type, full_name;


-- High and low performers
SELECT patient_id, name, satisfaction, 'High Performer' AS category FROM patients
WHERE satisfaction >= 90
UNION
SELECT patient_id, name, satisfaction, 'Low Performer' AS category FROM patients
WHERE satisfaction < 50
ORDER BY satisfaction DESC;


-- All unique services from multiple tables
SELECT DISTINCT service FROM patients
UNION
SELECT DISTINCT service FROM staff
UNION
SELECT DISTINCT service FROM services_weekly;



-- Monthly summary from different metrics
SELECT
    'Admissions' AS metric,
    month,
    SUM(patients_admitted) AS value
FROM services_weekly
GROUP BY month
UNION ALL
SELECT
    'Refusals' AS metric,
    month,
    SUM(patients_refused) AS value
FROM services_weekly
GROUP BY month
ORDER BY month, metric;


-- If you know there are no duplicates, use UNION ALL
SELECT * FROM patients WHERE age < 30 
UNION ALL 
SELECT * FROM patients WHERE age > 60;
-- No overlap, use UNION ALL

-- ORDER BY goes at the end (not in individual queries)
SELECT name FROM patients
UNION
SELECT staff_name FROM staff
ORDER BY name;  -- Sorts combined result