select * from patients where name like 'p%';

select * from patients where age > 50 and service = 'emergency';

select name as patient_name from patients where service in ("emergency", "ICU");