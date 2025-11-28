-- Question: Create a comprehensive hospital performance dashboard using CTEs. Calculate: 
-- 1) Service-level metrics (total admissions, refusals, avg satisfaction), 
-- 2) Staff metrics per service (total staff, avg weeks present), 
-- 3) Patient demographics per service (avg age, count). 
-- Then combine all three CTEs to create a final report showing service name, all calculated metrics, 
-- and an overall performance score (weighted average of admission rate and satisfaction). 
-- Order by performance score descending.

WITH service_metrics AS (
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

staff_metrics AS (
    SELECT 
        s.service,
        COUNT(DISTINCT s.staff_id) AS total_staff,
        ROUND(AVG(ss.present), 2) AS avg_weeks_present
    FROM staff s
    LEFT JOIN staff_schedule ss 
        ON s.staff_id = ss.staff_id
    GROUP BY s.service
),
patient_demographics AS (
    SELECT 
        service,
        COUNT(patient_id) AS patient_count,
        ROUND(AVG(age), 2) AS avg_age
    FROM patients
    GROUP BY service
)
SELECT 
    sm.service,
    -- Service Metrics
    sm.total_admissions,
    sm.total_refusals,
    sm.avg_satisfaction,
    st.total_staff,
    st.avg_weeks_present,
    pd.patient_count,
    pd.avg_age,
    ROUND(
        (sm.total_admissions * 1.0 / 
        NULLIF(sm.total_admissions + sm.total_refusals, 0)) * 0.6
        + (sm.avg_satisfaction / 100.0) * 0.4
    , 3) AS performance_score
FROM service_metrics sm
LEFT JOIN staff_metrics st 
    ON sm.service = st.service
LEFT JOIN patient_demographics pd 
    ON sm.service = pd.service

ORDER BY performance_score DESC;

