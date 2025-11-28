-- 1. Create a CTE to calculate service statistics, then query from it.
WITH service_stats AS (
    SELECT 
        sw.service,
        SUM(sw.available_beds) AS total_admissions,
        SUM(sw.patients_request - sw.available_beds) AS total_refusals,
        ROUND(AVG(p.satisfaction), 2) AS avg_satisfaction
    FROM services_weekly sw
    LEFT JOIN patients p 
        ON sw.service = p.service
    GROUP BY sw.service
)

SELECT * FROM service_stats;
