-- 11. Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pt.name,
    SUM(od.quantity * p.price) AS revenue,
    ROUND(
        (
            SUM(od.quantity * p.price) * 100.0 
            / SUM(SUM(od.quantity * p.price)) OVER ()
        )::NUMERIC, 
        2
    ) AS percentage_contribution
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY percentage_contribution DESC;