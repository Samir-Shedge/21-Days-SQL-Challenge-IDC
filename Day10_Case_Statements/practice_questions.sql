-- 1. Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
SELECT 
    *,
    CASE
		WHEN satisfaction >= 80 THEN 'High'
        WHEN satisfaction >= 50 THEN 'Medium'
        WHEN satisfaction IS NULL THEN 'Not Rated'
        ELSE 'Low'
	END AS satisfaction_category
FROM
    patients;


-- 2. Label staff roles as 'Medical' or 'Support' based on role type.
SELECT 
    *,
    CASE
		WHEN role IN('doctor', 'nurse') THEN 'Medical'
        WHEN role = 'nursing_assistant' THEN 'Support'
        ELSE 'Other'
	END AS role_label
FROM
    staff;


-- 3. Create age groups for patients (0-18, 19-40, 41-65, 65+).
SELECT 
    *,
    CASE
		WHEN age <= 18 THEN 'Minor'
        WHEN age <= 40 THEN 'Adult'
        WHEN age <= 65 THEN 'Middle-aged'
        ELSE 'Senior'
	END AS age_group
FROM
    patients;