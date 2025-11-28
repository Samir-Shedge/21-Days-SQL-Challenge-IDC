-- 2. Use multiple CTEs to break down a complex query into logical steps.
WITH service_cte AS (
    SELECT 
        sw.service,
        SUM(sw.available_beds) AS total_admissions,
        SUM(sw.patients_request - sw.available_beds) AS total_refusals,
        ROUND(AVG(p.satisfaction), 2) AS avg_satisfaction
    FROM services_weekly sw
    LEFT JOIN patients p 
        ON sw.service = p.service
    GROUP BY sw.service
),

staff_cte AS (
    SELECT 
        s.service,
        COUNT(DISTINCT s.staff_id) AS total_staff,
        ROUND(AVG(ss.present), 2) AS avg_weeks_present
    FROM staff s
    LEFT JOIN staff_schedule ss 
        ON s.staff_id = ss.staff_id
    GROUP BY s.service
),
patient_cte AS (
    SELECT 
        service,
        COUNT(patient_id) AS patient_count,
        ROUND(AVG(age), 2) AS avg_age
    FROM patients
    GROUP BY service
)
SELECT s.service, s.total_admissions, s.total_refusals, s.avg_satisfaction, st.total_staff, st.avg_weeks_present, p.patient_count, p.avg_age
FROM service_cte s
LEFT JOIN staff_cte st 
    ON s.service = st.service
LEFT JOIN patient_cte p 
    ON s.service = p.service;
