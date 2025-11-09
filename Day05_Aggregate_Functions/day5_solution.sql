USE hospitals;

-- Question: Calculate the total number of patients admitted, total patients refused,
-- and the average patient satisfaction across all services and weeks. 
-- Round the average satisfaction to 2 decimal places.

SELECT 
    SUM(patients_admitted) AS total_admitted_patient,
    SUM(patients_refused) AS total_refused_patient,
    ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction
FROM
    services_weekly;