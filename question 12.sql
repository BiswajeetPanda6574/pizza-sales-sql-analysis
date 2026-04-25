-- 12. Analyze the cumulative revenue generated over time.

SELECT 
    order_date,
    SUM(daily_revenue) OVER (ORDER BY order_date) AS cumulative_revenue
FROM (
    SELECT 
        o.order_date,
        SUM(od.quantity * p.price) AS daily_revenue
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    JOIN pizzas p ON od.pizza_id = p.pizza_id
    GROUP BY o.order_date
) AS daily_data
ORDER BY order_date;