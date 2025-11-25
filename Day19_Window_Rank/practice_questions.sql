-- ### Practice Questions:

-- 1. Rank patients by satisfaction score within each service.
SELECT
    patient_id,
    name,
    service,
    satisfaction,
    RANK() OVER (
        PARTITION BY service
        ORDER BY satisfaction DESC
    ) AS satisfaction_rank
FROM patients;

-- 2. Assign row numbers to staff ordered by their name.
SELECT
    staff_id,
    staff_name,
    ROW_NUMBER() OVER (
        ORDER BY staff_name
    ) AS row_num
FROM staff;



-- 3. Rank services by total patients admitted.
SELECT
    service,
    SUM(patients_admitted) AS total_patients,
    RANK() OVER (
        ORDER BY SUM(patients_admitted) DESC
    ) AS service_rank
FROM services_weekly
GROUP BY service;

