-- Create a report showing each service with: service name, total patients admitted, the difference between  
-- their total admissions and the average admissions across all services, and a rank indicator ('Above Average', 
--  'Average', 'Below Average'). Order by total patients admitted descending.

WITH service_totals AS (
    SELECT
        service,
        COUNT(patient_id) AS total_patients
    FROM admissions
    GROUP BY service
),
overall AS (
    SELECT AVG(total_patients) AS overall_avg
    FROM service_totals
)
SELECT
    st.service,
    st.total_patients,
    st.total_patients - o.overall_avg AS difference_from_avg,
    CASE
        WHEN st.total_patients > o.overall_avg THEN 'Above Average'
        WHEN st.total_patients = o.overall_avg THEN 'Average'
        ELSE 'Below Average'
    END AS rank_indicator
FROM service_totals st
CROSS JOIN overall o
ORDER BY st.total_patients DESC;
