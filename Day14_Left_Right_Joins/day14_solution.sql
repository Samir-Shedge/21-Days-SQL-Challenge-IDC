-- Create a staff utilisation report showing all staff members (staff_id, staff_name, role, service) and the
-- count of weeks they were present (from staff_schedule). Include staff members even if they have no schedule records. 
-- Order by weeks present descending.

SELECT 
    s.staff_id,
    s.staff_name,
    s.role,
    s.service,
    SUM(COALESCE(ss.present)) AS weeks_present
FROM
    staff AS s
        LEFT JOIN
    staff_schedule AS ss ON s.staff_id = ss.staff_id
        AND ss.present = 1
GROUP BY s.staff_id , s.staff_name , s.role , s.service
ORDER BY weeks_present DESC;

