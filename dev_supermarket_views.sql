
--1) customer membership 
-- amount customer saved in his shopping each month because of membership

CREATE OR REPLACE VIEW new_customer_savings_view AS
SELECT
    c.name AS customer_name,
    TO_CHAR(cr.date_created, 'MM') AS month,
    ABS(SUM(cd.salesprice - i.costprice)) AS amount_saved
FROM
    customer c
    JOIN cart cr ON c.cid = cr.cid
    JOIN cart_details cd ON cr.ctid = cd.ctid
    JOIN inventory i ON cd.iid = i.iid
GROUP BY
    TO_CHAR(cr.date_created, 'MM'),
    c.name;

--2) sales summary 
-- sorted products in inventory by quantity sold and margin made
CREATE OR REPLACE VIEW inventory_sales_view AS
SELECT
    i.iid,
    i.name,
    COUNT(*) quantity_sold,
    SUM(cd.salesprice - i.purchaseprice) margin_per_item
FROM
    customer c
    JOIN cart cr ON c.cid = cr.cid
    JOIN cart_details cd ON cr.ctid = cd.ctid
    JOIN inventory i ON cd.iid = i.iid
GROUP BY
    i.iid, i.name
ORDER BY
    COUNT(*) DESC, SUM(cd.salesprice - i.purchaseprice) desc;

SELECT * FROM inventory_sales_view;

-- 3) products that need to be replaced 
CREATE OR REPLACE VIEW replace_inventory_view AS
SELECT *
FROM inventory
WHERE (perishable = 'Y' AND (expiration_date - SYSDATE) < 10) OR (quantity = 0);

SELECT * FROM perishable_inventory_view;



-- 4) Customer transactions


CREATE OR REPLACE VIEW customer_transactions_view AS
SELECT
    c.cid AS customer_id,
    c.name AS customer_name,
    t.tid AS transaction_id,
    t.total_payment AS total_payment,
    t.payment_details AS payment_details,
    ct.date_created AS transaction_date
FROM
    CUSTOMER c
    JOIN CART ct ON c.cid = ct.cid
    JOIN TRANSACTIONS t ON ct.ctid = t.ctid;

SELECT * FROM customer_transactions_view;

-- 5) most product sold

CREATE OR REPLACE VIEW most_sold_products_view AS
SELECT
    i.iid AS product_id,
    i.name AS product_name,
    COUNT(*) AS quantity_sold
FROM
    CART_DETAILS cd
    JOIN INVENTORY i ON cd.iid = i.iid
GROUP BY
    i.iid, i.name
ORDER BY
    COUNT(*) DESC;
    
    
-- customer invoice

select * from cart_details;
select cr.ctid, i.name, i.costprice, cd.salesprice,  cd.quantity, cr.date_created
from cart_details cd
join cart cr on cr.ctid = cd.ctid
join customer c on cr.cid = c.cid
join inventory i on cd.iid = i.iid
order by cr.ctid, date_created;

-- orders per day


-- sales per season
-- choose between this or the next one
create or replace view total_sales_per_season as
select season, sum(total_payment) total_sales, count(*) number_of_Sales from 
(
select  temp.*, 
case when month_cart_created >= 1 and month_cart_created <= 3 then 
    	'Winter'
    	when month_cart_created >= 4 and month_cart_created <= 6 then 
    	'Spring'
    	when month_cart_created >= 7 and month_cart_created <= 9 then
    	'Summer'
    	when month_cart_created >= 10 and month_cart_created <= 12 then
    	'Autumn'
    end as season
from (
select c.ctid, e.eid, to_char(c.date_created, 'MM') month_cart_created,t.total_payment
from cart c
join transactions t on c.ctid = t.ctid
join employee e on c.eid = e.eid
) temp
) temp2 group by season;

--per month total sales per employee + number of sales
create or replace view per_month_sales_per_employee as
select month_cart_created, eid, sum(total_payment) total_sales, count(*) number_of_sales
from (
select c.ctid, e.eid, to_char(c.date_created, 'MM') month_cart_created,t.total_payment
from cart c
join transactions t on c.ctid = t.ctid
join employee e on c.eid = e.eid
) temp
group by rollup(month_cart_created, eid)
order by month_cart_created; 


-- heirarchial query 
-- have to do more
select e.eid, e.name, e.hire_date, e.type, e.salary, level , sys_connect_by_path(name, '->') as chain_of_command
from employee e
start with reports_to is null
connect by prior e.eid = e.reports_to;


