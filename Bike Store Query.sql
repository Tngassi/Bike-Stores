Select
	ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name) AS 'customers',
	cus.city,
	cus.state,
	ord.order_date,
	SUM(item.quantity) AS 'total_units',
	SUM(item.quantity * item.list_price) AS 'revenue',
	prod.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name) AS 'sales_rep'
From sales.orders ord
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items item
ON ord.order_id = item.order_id
JOIN production.products prod
ON item.product_id = prod.product_id
JOIN production.categories cat
ON prod.category_id = cat.category_id
JOIN sales.stores sto
ON ord.store_id = sto.store_id
JOIN sales.staffs sta
ON ord.staff_id = sta.staff_id
Group by
	ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	prod.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name)

