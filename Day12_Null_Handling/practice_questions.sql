-- 1. Find all weeks in services_weekly where no special event occurred.
SELECT
    week,
    event
FROM services_weekly
WHERE event IS NULL 
   OR event = 'none';

-- 2. Count how many records have null or empty event values.
SELECT
    COUNT(*) AS null_event_values
FROM services_weekly
WHERE event IS NULL 
   OR event = 'none';

-- 3. List all services that had at least one week with a special event.
SELECT
    DISTINCT service
FROM services_weekly
WHERE event IS NOT NULL
  AND event <> 'none';
