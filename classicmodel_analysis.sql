
use classicmodels;
show tables;


-- using SELECT, WHERE, ORDER BY, GROUP BY

-- customers from USA

select customerName, city, country
from customers
where country= 'USA'
order by city;

-- total orders per customer 

select customerNumber, count(orderNumber) as total_orders
from orders
group by customerNumber
order by total_orders desc;

-- JOINS(INNER, LEFT)

-- INNER JOIN (Customers + Orders)
select c.customerName, o.orderNumber, o.status
from customers c
inner join orders o
on c.customerNumber = o.customerNumber;

-- LEFT JOIN (All Customers Even Without Orders)
select c.customerName, o.orderNumber
from customers c
left join orders o
on c.customerNumber = o.customerNumber;

-- SUBQUERY
-- Customers Who Spent More Than Average Payment
select customerNumber, sum(amount) as total_paid
from payments
group by customerNumber
having total_paid >
(
	select avg(amount)
    from payments
)
order by total_paid desc;

-- AGGREGATE FUNCTIONS

-- sum(total revenue)
select sum(amount)
from payments;

-- Average Product Price
select avg(buyPrice)
from products;

-- Create Customer Sales View
create view customer_sales as
select c.customerName, sum(p.amount) as total_paid
from customers c
join payments p
on c.customerNumber = p.customerNumber
group by c.customerName;

-- CREATE INDEX
select * from customer_sales;

SELECT *
FROM orders
WHERE customerNumber = 103;


create index indx_customernumber
on orders(customerNumber);

