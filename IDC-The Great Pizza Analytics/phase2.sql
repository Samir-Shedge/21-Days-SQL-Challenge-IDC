-- **Phase 2: Filtering & Exploration**

-- 1. Orders placed on `'2015-01-01'` (`SELECT` + `WHERE`).
select * from orders where date = '2015-01-01';

-- 2. List pizzas with `price` descending.
select * from pizzas order by price desc;

-- 3. Pizzas sold in sizes `'L'` or `'XL'`.
select pizza_type_id as pizza_name from pizzas where lower(size) in ('xl', 'l');

-- 4. Pizzas priced between $15.00 and $17.00.
select * from pizzas where price between 15.00 and 17.00 ;

-- 5. Pizzas with `"Chicken"` in the name.
select * from pizza_types where lower(name) like '%chicken%';

-- 6. Orders on `'2015-02-15'` or placed after 8 PM.
select * from orders where date='2015-02-15' or time > '20:00:00' ;