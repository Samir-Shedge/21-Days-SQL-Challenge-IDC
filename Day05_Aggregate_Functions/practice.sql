USE hospitals;

SELECT AVG(satisfaction) FROM patients WHERE age>60;

SELECT COUNT(*) FROM patients WHERE service = "ICU";


SELECT COUNT(*) FROM patients where service IS NULL;

select count(*) from patients;