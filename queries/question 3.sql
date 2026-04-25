-- 3. Identify the highest-priced pizza.
SELECT pizza_id, price
FROM pizzas
ORDER BY price DESC
LIMIT 1;