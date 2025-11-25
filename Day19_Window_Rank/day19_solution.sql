-- For each service, rank the weeks by patient satisfaction score (highest first). 
-- Show service, week, patient_satisfaction, patients_admitted, and the rank.
-- Include only the top 3 weeks per service.

SELECT 
    *
FROM (
    SELECT
        week,
        service,
        patient_satisfaction,
        patients_admitted,
        DENSE_RANK() OVER (
            PARTITION BY service
            ORDER BY patient_satisfaction DESC
        ) AS d_rnk
    FROM services_weekly
) AS t
WHERE d_rnk <= 3;
