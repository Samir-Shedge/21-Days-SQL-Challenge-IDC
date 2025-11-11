-- Question: Create a patient summary that shows patient_id, full name in uppercase, service in
-- lowercase, age category (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), 
-- and name length. Only show patients whose name length is greater than 10 characters.

SELECT 
    patient_id,
    UPPER(name) AS full_name,
    LOWER(service) AS service,
    CASE
        WHEN age >= 65 THEN 'Senior' 
        WHEN age >= 18 THEN 'Adult'
        ELSE 'Minor'
    END AS age_category,
    LENGTH(name) AS name_length
FROM
    patients
WHERE LENGTH(name) > 10;