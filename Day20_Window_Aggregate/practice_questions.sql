### Practice Questions:
-- 1. Calculate running total of patients admitted by week for each service.
SELECT
    service,
    week,
    patients_admitted,
    SUM(patients_admitted) OVER (
        PARTITION BY service
        ORDER BY week
    ) AS running_total_admitted
FROM services_weekly
ORDER BY service, week;



-- 2. Find the moving average of patient satisfaction over 4-week periods.
SELECT
    service,
    week,
    patient_satisfaction,
    AVG(patient_satisfaction) OVER (
        PARTITION BY service
        ORDER BY week
        ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
    ) AS moving_avg_4_weeks
FROM services_weekly
ORDER BY service, week;



-- 3. Show cumulative patient refusals by week across all services.
SELECT
    week,
    patients_refused,
    SUM(patients_refused) OVER (
        ORDER BY week
    ) AS cumulative_refusals
FROM services_weekly
ORDER BY week;
