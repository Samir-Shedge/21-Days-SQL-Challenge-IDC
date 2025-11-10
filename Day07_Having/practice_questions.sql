-- 1. Find services that have admitted more than 500 patients in total.
SELECT 
    service, SUM(patients_admitted) AS total_patients
FROM
    services_weekly
GROUP BY service
HAVING SUM(patients_admitted) > 500;


-- 2. Show services where average patient satisfaction is below 75.
SELECT 
	service, AVG(satisfaction) AS avg_stfn
FROM
	patients
GROUP BY service
HAVING AVG(satisfaction) < 75;


-- 3. List weeks where total staff presence across all services was less than 50.
SELECT 
    week, SUM(present) AS present_cnt
FROM
    staff_schedule
GROUP BY week
HAVING SUM(present) < 50;


