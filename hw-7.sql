
-- 1   Вывести названия продуктов таблица products, включая количество заказанных единиц quantity для каждого продукта
--  таблица order_details.
-- Решить задачу с помощью cte и подзапроса

WITH quantity_orders AS (
    SELECT product_id, SUM(quantity) AS total_quantity
    FROM order_details
    GROUP BY product_id
)
SELECT products.product_name, quantity_orders.total_quantity
FROM products
LEFT JOIN quantity_orders ON products.id = quantity_orders.product_id;


SELECT products.product_name, 
       (SELECT SUM(quantity) 
        FROM order_details 
        WHERE order_details.product_id = products.id) AS quantity
FROM products;





-- 2  Найти все заказы таблица orders, сделанные после даты самого первого заказа клиента Lee таблица customers.

SELECT * 
FROM orders 
WHERE order_date > (
    SELECT MIN(orders.order_date) 
    FROM orders
    JOIN customers ON orders.customer_id = customers.id
    WHERE customers.last_name = 'Lee'
);



-- 3 Найти все продукты таблицы  products c максимальным target_level

SELECT * 
FROM products 
WHERE target_level = (SELECT MAX(target_level) FROM products);