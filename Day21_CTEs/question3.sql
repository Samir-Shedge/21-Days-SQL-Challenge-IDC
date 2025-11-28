-- 3. Build a CTE for staff utilization and join it with patient data.

WITH staff_utilization AS (
    SELECT 
        s.service,
        COUNT(DISTINCT s.staff_id) AS total_staff,
        ROUND(AVG(ss.present), 2) AS avg_weeks_present
    FROM staff s
    LEFT JOIN staff_schedule ss
        ON s.staff_id = ss.staff_id
    GROUP BY s.service
)

SELECT 
    su.service,
    su.total_staff,
    su.avg_weeks_present,
    COUNT(p.patient_id) AS total_patients,
    ROUND(AVG(p.age), 2) AS avg_patient_age
FROM staff_utilization su
LEFT JOIN patients p
    ON su.service = p.service
GROUP BY 
    su.service, 
    su.total_staff, 
    su.avg_weeks_present;
