-- Create a comprehensive service analysis report for week 20 showing: service name,total patients admitted 
-- that week, total patients refused, average patient satisfaction, count of staff assigned to service, 
-- and count of staff present that week. Order by patients admitted descending.

SELECT 
    sw.service,
    sw.patients_admitted AS total_patients_admitted,
    sw.patients_refused AS total_patients_refused,
    sw.patient_satisfaction AS avg_patient_satisfaction,

    COUNT(DISTINCT st.staff_id) AS staff_assigned,
    COUNT(DISTINCT CASE WHEN ss.present = 1 THEN ss.staff_id END) AS staff_present

FROM services_weekly AS sw
LEFT JOIN staff AS st
    ON sw.service = st.service
LEFT JOIN staff_schedule AS ss
    ON st.staff_id = ss.staff_id
    AND sw.week = ss.week

WHERE sw.week = 20

GROUP BY 
    sw.service,
    sw.patients_admitted,
    sw.patients_refused,
    sw.patient_satisfaction

ORDER BY total_patients_admitted DESC;
