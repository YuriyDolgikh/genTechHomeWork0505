-- База данных - https://github.com/annykh/genTech/blob/main/store.sql
-- Тех. описание базы - https://github.com/annykh/genTech/blob/main/store_%D1%82%D0%B5%D1%85_%D0%BE%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5.txt

select * from categories;
select * from customers;
select * from products;
select * from orders;
select * from order_items;

-- 1. Вывести список категорий(category_name) и товаров(product_name), которые относятся к этим категориям.
select cat.category_name, prd.product_name 
from categories cat
join products prd
on cat.category_id = prd.category_id;

-- 2. Получить список всех товаров(product_name), включённых в заказы, с указанием их цен(price) и категорий(category_name).
select distinct prd.product_name, prd.price, cat.category_name
from order_items itm
join products prd
on itm.product_id = prd.product_id
join categories cat
on cat.category_id = prd.category_id;

-- 3. Найти заказы, содержащие товар "Laptop". Вывести order_id, order_date, first_name, last_name.
select ord.order_id, ord.order_date, cst.first_name, cst.last_name
from orders ord
join customers cst
on ord.customer_id = cst.customer_id
join order_items itm
on ord.order_id = itm.order_id
join products prd
on itm.product_id = prd.product_id
where prd.product_name = 'Laptop';

-- 4. Вывести даты заказов(order_date) и имена клиентов(first_name, last_name), которые их сделали.
select ord.order_date, cst.first_name, cst.last_name
from orders ord
join customers cst
on ord.customer_id = cst.customer_id;

-- 5. Вывести названия товаров(product_name), которые заказывал клиент с фамилией 'Smith'.
select prd.product_name
from orders ord
join customers cst
on ord.customer_id = cst.customer_id
join order_items itm
on ord.order_id = itm.order_id
join products prd
on itm.product_id = prd.product_id
where cst.last_name = 'Smith';

-- 6. Найти имена и фамилии клиентов, которые купили товары из категории "Electronics".
select cst.first_name, cst.last_name
from orders ord
join customers cst
on ord.customer_id = cst.customer_id
join order_items itm
on ord.order_id = itm.order_id
join products prd
on itm.product_id = prd.product_id
join categories cat
on prd.category_id = cat.category_id
where cat.category_name = 'Electronics';

-- 7. Вывести названия товаров и их количество(quantity) в каждом заказе.
select itm.order_id, prd.product_name, itm.quantity
from order_items itm
join products prd
on itm.product_id = prd.product_id;

-- 8. Получить список всех товаров(product_name), включённых в заказ клиента с email 'john@example.com'.
select prd.product_name
from orders ord
join customers cst
on ord.customer_id = cst.customer_id
join order_items itm
on ord.order_id = itm.order_id
join products prd
on itm.product_id = prd.product_id
where cst.email = 'john@example.com';

-- 9. Вывести список всех заказанных товаров с указанием клиентов, которые их заказали.
select prd.product_name, concat(cst.first_name, ' ', cst.last_name) as client
from orders ord
join customers cst
on ord.customer_id = cst.customer_id
join order_items itm
on ord.order_id = itm.order_id
join products prd
on itm.product_id = prd.product_id;

-- 10. Получить список клиентов(first_name, last_name), которые заказали "Phone".
select cst.first_name, cst.last_name
from orders ord
join customers cst
on ord.customer_id = cst.customer_id
join order_items itm
on ord.order_id = itm.order_id
join products prd
on itm.product_id = prd.product_id
where prd.product_name = 'Phone';




