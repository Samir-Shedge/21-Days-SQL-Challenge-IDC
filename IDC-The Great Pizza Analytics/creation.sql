create database IDC_Pizza;
use IDC_Pizza;


-- 1. Create the pizza_types table (No Foreign Keys)
CREATE TABLE pizza_types (
    pizza_type_id VARCHAR(50) PRIMARY KEY,   -- e.g., 'bbq_ckn'
    name VARCHAR(100),                       -- e.g., 'The Barbecue Chicken Pizza'
    category VARCHAR(50),                    -- e.g., 'Chicken'
    ingredients TEXT                         -- e.g., 'Barbecued Chicken, Red Peppers, ...'
);

-- 2. Create the pizzas table (FK to pizza_types)
CREATE TABLE pizzas (
    pizza_id VARCHAR(50) PRIMARY KEY,        -- e.g., 'bbq_ckn_s'
    pizza_type_id VARCHAR(50),
    size VARCHAR(10),                        -- e.g., 'S', 'M', 'L'
    price DECIMAL(5,2),                      -- e.g., 12.75
    FOREIGN KEY (pizza_type_id) REFERENCES pizza_types(pizza_type_id)
);

-- 3. Create the orders table (No Foreign Keys)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    date DATE,
    time TIME                                -- MySQL supports TIME directly
);

-- 4. Create the order_details table (FK to orders and pizzas)
CREATE TABLE order_details (
    order_details_id INT PRIMARY KEY,
    order_id INT,
    pizza_id VARCHAR(50),
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id)
);
