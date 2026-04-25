-- 7. Determine the distribution of orders by hour of the day.

SELECT EXTRACT(HOUR FROM order_time) AS hour,
       COUNT(*) AS total_orders
FROM orders
GROUP BY hour
ORDER BY hour;