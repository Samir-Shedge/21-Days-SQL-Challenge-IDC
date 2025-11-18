-- 1. Show all staff members and their schedule information (including those with no schedule entries).
use hospital;
select * from staff;
select * from staff_schedule;

SELECT 
    s.staff_id,
    s.staff_name,
    s.role,
    s.service,
    ss.week,
    ss.present
FROM
    staff AS s
        LEFT JOIN
    staff_schedule AS ss ON s.staff_id = ss.staff_id;


-- 2. List all services from services_weekly and their corresponding staff (show services even if no staff assigned).
SELECT 
    sw.service, st.staff_id, st.staff_name
FROM
    services_weekly AS sw
        LEFT JOIN
    staff AS st ON sw.service = st.service;


-- 3. Display all patients and their service's weekly statistics (if available).
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.age,
    p.service,
    sw.week,
    sw.patient_satisfaction,
    sw.patients_admitted
FROM
    patients AS p
        LEFT JOIN
    services_weekly AS sw ON p.service = sw.service; 
