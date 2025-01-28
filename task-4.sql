USE `db_hw-3`;

-- 1. Визначте кількість рядків (COUNT)
SELECT COUNT(*) AS total_rows
from orders
inner join order_details on order_details.order_id = orders.id
inner join shippers on shippers.id = orders.shipper_id
inner join employees on employees.employee_id = orders.employee_id
inner join customers on customer_id = orders.customer_id
inner join products on products.id = order_details.product_id
inner join suppliers on suppliers.id = products.supplier_id
inner join categories on categories.id = products.category_id;

-- 2. Зміна INNER JOIN на LEFT JOIN та аналіз змін у кількості рядків
SELECT COUNT(*) AS total_rows_with_left
from orders
left join order_details on order_details.order_id = orders.id
left join shippers on shippers.id = orders.shipper_id
left join employees on employees.employee_id = orders.employee_id
left join customers on customer_id = orders.customer_id
left join products on products.id = order_details.product_id
left join suppliers on suppliers.id = products.supplier_id
left join categories on categories.id = products.category_id;

-- 3. Оберіть тільки ті рядки, де employee_id > 3 та ≤ 10
SELECT 
    order_details.id AS order_id,
    employees.employee_id,
    employees.first_name AS employee_name,
    products.name AS product_name,
    order_details.quantity
FROM orders
inner join employees ON employees.employee_id = orders.employee_id
inner join order_details on order_details.order_id = orders.id
inner join products on products.id = order_details.product_id
WHERE employees.employee_id > 3 AND employees.employee_id <= 10;

-- 4. Згрупуйте за іменем категорії, порахуйте кількість рядків у групі, середню кількість товару
SELECT 
    cat.name AS category_name,
    COUNT(*) AS total_rows,
    AVG(od.quantity) AS avg_quantity
FROM order_details AS od
INNER JOIN products AS p ON p.id = od.product_id
INNER JOIN categories AS cat ON cat.id = p.category_id
GROUP BY cat.name;

-- 5. Відфільтруйте рядки, де середня кількість товару більша за 21
SELECT 
    cat.name AS category_name,
    COUNT(*) AS total_rows,
    AVG(od.quantity) AS avg_quantity
FROM order_details AS od
INNER JOIN products AS p ON p.id = od.product_id
INNER JOIN categories AS cat ON cat.id = p.category_id
GROUP BY cat.name
HAVING AVG(od.quantity) > 21
ORDER BY total_rows DESC;

-- 6. Виберіть чотири рядки з пропущеним першим рядком
SELECT 
    cat.name AS category_name,
    COUNT(*) AS total_rows,
    AVG(od.quantity) AS avg_quantity
FROM order_details AS od
INNER JOIN products AS p ON p.id = od.product_id
INNER JOIN categories AS cat ON cat.id = p.category_id
GROUP BY cat.name
HAVING AVG(od.quantity) > 21
ORDER BY total_rows DESC
LIMIT 4 OFFSET 1;