-- 1. Show each patient with their service's average satisfaction as an additional column.
SELECT 
    p.patient_id,
    p.name,
    p.service,
    p.satisfaction,
    (SELECT 
            AVG(p2.satisfaction)
        FROM
            patients p2
        WHERE
            p2.service = p.service) AS service_avg_satisfaction
FROM
    patients p;


-- 2. Create a derived table of service statistics and query from it.
WITH service_stats AS (
    SELECT
        service,
        COUNT(patient_id) AS total_patients,
        AVG(satisfaction) AS avg_satisfaction
    FROM patients
    GROUP BY service)
SELECT *
FROM service_stats
ORDER BY total_patients DESC;


-- 3. Display staff with their service's total patient count as a calculated field.
SELECT
    s.staff_id,
    s.staff_name,
    sv.service,
    (
        SELECT COUNT(patient_id)
        FROM patients p
        WHERE p.service = sv.service
    ) AS total_patients
FROM staff s
JOIN services sv
ON s.staff_id = sv.staff_id;
