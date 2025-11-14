-- Find all unique combinations of service and event type from the services_weekly table
-- where events are not null or none, along with the count of occurrences for each combination.
-- Order by count descending.

-- 1 --  
SELECT service, event, COUNT(*) AS occurrences
FROM services_weekly
WHERE event IS NOT NULL and lower(event) != 'none'
GROUP BY service, event
ORDER BY occurrences DESC;

-- 2 -- 
SELECT service, TRIM(event) AS event, COUNT(*) AS occurrences
FROM services_weekly
WHERE event IS NOT NULL AND TRIM(event) <> '' AND LOWER(TRIM(event)) <> 'none'
GROUP BY service, TRIM(event)
ORDER BY occurrences DESC;

