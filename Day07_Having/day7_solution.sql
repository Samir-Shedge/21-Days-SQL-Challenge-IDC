-- Question: Identify services that refused more than 100 patients in total
-- and had an average patient satisfaction below 80. 
-- Show service name, total refused, and average satisfaction.

SELECT 
    service, SUM(patients_refused) AS total_refused, AVG(patient_satisfaction) as avg_satisfaction
FROM
    services_weekly
GROUP BY service
HAVING AVG(patient_satisfaction) < 80 AND SUM(patients_refused) > 100;