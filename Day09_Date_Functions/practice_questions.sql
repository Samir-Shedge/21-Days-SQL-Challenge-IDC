-- 1. Extract the year from all patient arrival dates.
SELECT *, EXTRACT(YEAR FROM arrival_date) AS arrival_year FROM patients;
-- OR 
SELECT YEAR(arrival_date) FROM patients;


-- 2. Calculate the length of stay for each patient (departure_date - arrival_date).
SELECT 
    patient_id,
    DATEDIFF(departure_date, arrival_date) AS patient_stay_days
FROM
    patients;


-- 3. Find all patients who arrived in a specific month.
SELECT * FROM patients WHERE MONTH(arrival_date)= 1;
-- OR
SELECT * FROM patients WHERE MONTHNAME(arrival_date) = 'March';
