SELECT CURDATE();

SELECT CURRENT_DATE();

SELECT NOW();

SELECT CURTIME();

SELECT DATE(arrival_date) AS arrival_date FROM patients;

SELECT MONTHNAME(arrival_date) AS arrival_month FROM patients;
SELECT DAYNAME(arrival_date) AS arrival_day FROM patients;