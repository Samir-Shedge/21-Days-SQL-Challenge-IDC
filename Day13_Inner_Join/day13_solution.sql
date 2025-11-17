-- Create a comprehensive report showing patient_id, patient name, age, service, and the total number of staff members 
-- available in their service. Only include patients from services that have more than 5 staff members. 
-- Order by number of staff descending, then by patient name.

SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.age AS patient_age,
    p.service,
    s.total_staff_members
FROM
    patients p
        JOIN
    (SELECT 
        service, COUNT(*) AS total_staff_members
    FROM
        staff
    GROUP BY service
    HAVING COUNT(*) > 5) AS s ON p.service = s.service
ORDER BY s.total_staff_members DESC , p.name;
