-- **Phase 3: Sales Performance**

-- 1. Total quantity of pizzas sold (`SUM`).
select sum(quantity) as total_quantity_sold from order_details;

-- 2. Average pizza price (`AVG`).
select avg(price) avg_pizza_price from pizzas;

-- 3. Total order value per order (`JOIN`, `SUM`, `GROUP BY`).
SELECT 
    od.order_id,
    SUM(od.quantity * p.price) AS total_order_value
FROM order_details od
JOIN pizzas p 
      ON od.pizza_id = p.pizza_id
GROUP BY od.order_id;

-- 4. Total quantity sold per pizza category (`JOIN`, `GROUP BY`).
SELECT 
    category, sum(quantity) as total_quantity_sold
FROM
    order_details AS od
        JOIN
    pizzas AS p ON od.pizza_id = p.pizza_id
        JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
group by category;

-- 5. Categories with more than 5,000 pizzas sold (`HAVING`).
SELECT 
    category, sum(quantity) as total_quantity_sold
FROM
    order_details AS od
        JOIN
    pizzas AS p ON od.pizza_id = p.pizza_id
        JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
group by category
having sum(quantity) > 5000;

-- 6. Pizzas never ordered (`LEFT/RIGHT JOIN`).
SELECT 
    p.pizza_id,
    p.pizza_type_id,
    p.size,
    p.price
FROM pizzas AS p
LEFT JOIN order_details AS od
       ON p.pizza_id = od.pizza_id
WHERE od.pizza_id IS NULL;

-- 7. Price differences between different sizes of the same pizza (`SELF JOIN`).
SELECT 
    p1.pizza_type_id,
    p1.size AS size_1,
    p1.price AS price_1,
    p2.size AS size_2,
    p2.price AS price_2,
    (p2.price - p1.price) AS price_difference
FROM pizzas p1
JOIN pizzas p2
      ON p1.pizza_type_id = p2.pizza_type_id
     AND p1.size <> p2.size
ORDER BY p1.pizza_type_id, size_1, size_2;
