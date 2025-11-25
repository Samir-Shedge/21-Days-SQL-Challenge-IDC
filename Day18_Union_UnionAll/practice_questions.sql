-- 1. Combine patient names and staff names into a single list.
select name from patients
 union all
select staff_name from staff;

-- 2. Create a union of high satisfaction patients (>90) and low satisfaction patients (<50).
select patient_id, name, satisfaction, 'High Performance' as category from patients where satisfaction > 90
union all
select patient_id, name, satisfaction, 'Low Performance' as category  from patients where satisfaction < 50;

-- 3. List all unique names from both patients and staff tables.
select name as patient_name from patients
union 
select staff_name as patient_name from staff;