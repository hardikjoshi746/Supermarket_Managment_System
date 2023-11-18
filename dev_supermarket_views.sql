show user;
select * from customer;

--1) customer membership 
select c.name, to_char(cr.date_created, 'MM') month,  abs(sum(cd.salesprice - i.costprice)) amount_Saved
from customer c join cart cr on c.cid = cr.cid
join cart_details cd on cr.ctid = cd.ctid
join inventory i on cd.iid = i.iid
group by to_char(cr.date_created, 'MM'), c.name;


--2) sales summary 

select i.iid,i.name, count(*) quantity_sold, sum(salesprice - purchaseprice) margin_per_item
from customer c join cart cr on c.cid = cr.cid
join cart_details cd on cr.ctid = cd.ctid
join inventory i on cd.iid = i.iid
group by i.iid, i.name
order by count(*) desc;


--select * from inventory;

-- 3) products that need to be replaced 
select *
from inventory 
where (perishable = 'Y' and (expiration_date - sysdate) < 10) or (quantity = 0); 

-- 4) top  products by month

