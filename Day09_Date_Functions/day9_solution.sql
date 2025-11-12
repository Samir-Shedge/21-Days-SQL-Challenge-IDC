-- Calculate the average length of stay (in days) for each service, showing only services 
-- where the average stay is more than 7 days. 
-- Also show the count of patients and order by average stay descending.

 
SELECT 
    service,
    COUNT(patient_id) AS total_patients,
    AVG(DATEDIFF(departure_date, arrival_date)) AS avg_stay
FROM
    patients
GROUP BY service
HAVING AVG(DATEDIFF(departure_date, arrival_date)) > 7
ORDER BY avg_stay DESC;