-- 1. Join patients, staff, and staff_schedule to show patient service and staff availability.
SELECT 
    p.name as patient_name,
    p.service,
    s.staff_name,
    ss.present,
    ss.week
FROM
    patients AS p
        JOIN
    staff AS s ON p.service = s.service
        LEFT JOIN
    staff_schedule AS ss ON s.staff_id = ss.staff_id; 
    

-- 2. Combine services_weekly with staff and staff_schedule for comprehensive service analysis.
SELECT 
    sw.week,
    sw.month,
    sw.service,
    sw.available_beds,
    sw.patients_request,
    sw.patients_admitted,
    sw.patients_refused,
    sw.patient_satisfaction,
    sw.staff_morale,
    sw.event,
    st.staff_id,
    st.staff_name,
    st.role,
    st.service AS staff_service,
    ss.present
FROM services_weekly AS sw
LEFT JOIN staff AS st
    ON sw.service = st.service
LEFT JOIN staff_schedule AS ss
    ON st.staff_id = ss.staff_id
    AND sw.week = ss.week;


-- 3. Create a multi-table report showing patient admissions with staff information.
SELECT
    p.patient_id,
    p.name AS patient_name,
    p.age,
    p.arrival_date,
    p.departure_date,
    p.service AS patient_service,
    sw.week,
    sw.available_beds,
    sw.patients_request,
    sw.patients_admitted,
    sw.patients_refused,
    sw.patient_satisfaction AS weekly_satisfaction,
    st.staff_id,
    st.staff_name,
    st.role,
    ss.present AS staff_present
FROM patients AS p
LEFT JOIN services_weekly AS sw
    ON p.service = sw.service
    AND WEEK(p.arrival_date, 1) = sw.week
LEFT JOIN staff AS st
    ON p.service = st.service
LEFT JOIN staff_schedule AS ss
    ON st.staff_id = ss.staff_id
    AND sw.week = ss.week;
