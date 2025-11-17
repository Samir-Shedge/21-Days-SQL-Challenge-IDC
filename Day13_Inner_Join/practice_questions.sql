-- 1. Join patients and staff based on their common service field (show patient and staff who work in same service).
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.service,
    s.staff_id,
    s.staff_name,
    s.role
FROM
    patients AS p
        INNER JOIN
    staff AS s ON p.service = s.service;

-- 2. Join services_weekly with staff to show weekly service data with staff information.
SELECT 
    sw.week,
    sw.service AS service_name,
    sw.patients_request,
    sw.patients_refused,
    sw.patients_admitted,
    sw.patient_satisfaction,
    sw.staff_morale,
    sw.event,
    s.staff_id,
    s.staff_name,
    s.role
FROM
    services_weekly AS sw
        INNER JOIN
    staff AS s ON sw.service = s.service;


-- 3. Create a report showing patient information along with staff assigned to their service.
SELECT 
    p.patient_id,
    p.name,
    p.age,
    p.service,
    s.staff_id,
    s.staff_name
FROM
    patients AS p
        INNER JOIN
    staff AS s ON p.service = s.service;
