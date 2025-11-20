-- **Phase 1: Foundation & Inspection**
-- 1. Install IDC_Pizza.dump as IDC_Pizza server

-- 2. List all unique pizza categories (`DISTINCT`).
select distinct(category) as pizza_categories from pizza_types;

-- 3. Display `pizza_type_id`, `name`, and ingredients, replacing NULL ingredients with `"Missing Data"`. Show first 5 rows.
select pizza_type_id, name as pizza_name, case when ingredients is null then 'Missing Data' else ingredients end as ingredients from pizza_types limit 5;

select pizza_type_id, name as pizza_name, coalesce(ingredients,'Missing Data') as ingredients from pizza_types limit 5;


-- 4. Check for pizzas missing a price (`IS NULL`).
select count(*) as price_null_values from pizzas where price is null;

