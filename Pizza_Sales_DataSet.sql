
select * from dominos.orders;
select * from dominos.order_details;
select * from dominos.pizza_types;
select * from dominos.pizzas;

SELECT * FROM dominos.pizzas;

-- Question 2:
-- Calculate the total revenue generated from pizza sales.
SELECT 
    SUM(pizzas.price * order_details.quantity) AS total_sales
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
;

-- Question 3: 
-- Identify the highest-priced pizza.
SELECT 
    pizzas.price, pizza_types.name
FROM
    pizzas
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
ORDER BY pizzas.price desc
LIMIT 1;

-- Question 4: 
-- Identify the most common pizza size ordered.

select pizzas.size, order_details.quantity
from pizzas
join order_details
on pizzas.pizza_id= order_details.pizza_id
order by (order_details.quantity) desc limit 1;

-- Question 5: 
-- List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pizza_types.name, SUM(order_details.quantity) as quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;

-- Question 6 : Intermediate level
-- Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT 
    pizza_types.category, SUM(order_details.quantity) as quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC;

-- Question 7: 
-- Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(order_time), COUNT(order_id)
FROM
    orders
GROUP BY HOUR(order_time);

-- Question 8: 
--  Join relevant tables to find the category-wise distribution of pizzas.

select category , count(name) from pizza_types 
group by (category);

-- Question 9:
-- Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    order_date, SUM(quantity)
FROM
    orders
        JOIN
    order_details ON orders.order_id = order_details.order_id
GROUP BY (order_date);

-- Question 10:
-- Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    SUM(pizzas.price * order_details.quantity) AS revenue
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY (order_details.quantity)
ORDER BY revenue DESC;

-- Question 11: 
-- Calculate the percentage contribution of each pizza type to total revenue.
-- Analyze the cumulative revenue generated over time.
-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.























