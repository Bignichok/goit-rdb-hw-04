use `db_hw-3`;

select *
from orders
inner join order_details on order_details.order_id = orders.id
inner join shippers on shippers.id = orders.shipper_id
inner join employees on employees.employee_id = orders.employee_id
inner join customers on orders.customer_id = customers.id
inner join products on products.id = order_details.product_id
inner join suppliers on suppliers.id = products.supplier_id
inner join categories on categories.id = products.category_id
;