select * from transactions;
delete from customer; --
drop sequence cid_seq;
delete from membership; --
drop sequence mid_seq;
delete from cart; --
drop sequence ctid_seq;
delete from employee; --
drop sequence eid_seq;
delete from inventory;
drop sequence iid_seq;
delete from cart_details;
delete from transactions;
drop sequence tid_seq;
delete from supplier;
drop sequence sid_seq;

create sequence eid_seq;
insert into employee(eid, name, hire_date, type, salary, reports_to)
values (eid_seq.nextval, 'sup1', add_months(trunc(sysdate), -12), 'Supervisor', 10000.00, null);
insert into employee(eid, name, hire_date, type, salary, reports_to)
values (eid_seq.nextval, 'mng1', add_months(trunc(sysdate), -11), 'Manager', 8000.00, 1);
insert into employee(eid, name, hire_date, type, salary, reports_to)
values (eid_seq.nextval, 'mng2', add_months(trunc(sysdate), -10), 'Manager', 8000.00, 1);
insert into employee(eid, name, hire_date, type, salary, reports_to)
values (eid_seq.nextval, 'csh1', add_months(trunc(sysdate), -10), 'Cashier', 6000.00, 2);
insert into employee(eid, name, hire_date, type, salary, reports_to)
values (eid_seq.nextval, 'stck1', add_months(trunc(sysdate), -12), 'Stocker', 5000.00, 3);
insert into employee(eid, name, hire_date, type, salary, reports_to)
values (eid_seq.nextval, 'csh2', add_months(trunc(sysdate), -12), 'Cashier', 6000.00, 2);
insert into employee(eid, name, hire_date, type, salary, reports_to)
values (eid_seq.nextval, 'csh3', add_months(trunc(sysdate), -13), 'Cashier', 6000.00, 2);
insert into employee(eid, name, hire_date, type, salary, reports_to)
values (eid_seq.nextval, 'stck2', add_months(trunc(sysdate), -9), 'Stocker', 5000.00, 3);
insert into employee(eid, name, hire_date, type, salary, reports_to)
values (eid_seq.nextval, 'mng3', add_months(trunc(sysdate), -10), 'Manager', 8000.00, 1);
insert into employee(eid, name, hire_date, type, salary, reports_to)
values (eid_seq.nextval, 'stck3', add_months(trunc(sysdate), -11), 'Stocker', 5000.00, 3);
insert into employee(eid, name, hire_date, type, salary, reports_to)
values (eid_seq.nextval, 'csh4', add_months(trunc(sysdate), -15), 'Cashier', 6000.00, 2);
insert into employee(eid, name, hire_date, type, salary, reports_to)
values (eid_seq.nextval, 'csh5', add_months(trunc(sysdate), -8), 'Cashier', 6000.00, 2);

-- insert more employee data

create sequence mid_seq;
insert into membership(mid, name, pricepermonth, benefits)
values (mid_seq.nextval, '10%off', 5, 10);
insert into membership(mid, name, pricepermonth, benefits)
values (mid_seq.nextval, '15%off', 10, 15);
insert into membership(mid, name, pricepermonth, benefits)
values (mid_seq.nextval, '20%off', 17, 20);
-- insert more membership data

create sequence cid_seq;
insert into customer(cid, name, dob, email, mid, m_st_date)
values (cid_seq.nextval, 'cust1', add_months(trunc(sysdate), -10*20), 'cust1@gmail.com', 1, to_date('11/25/2007', 'MM/DD/YYYY'));
insert into customer(cid, name, dob, email, mid, m_st_date)
values (cid_seq.nextval, 'cust2', add_months(trunc(sysdate), -10*15), 'cust2@gmail.com', 1, to_date('10/21/2010', 'MM/DD/YYYY'));
insert into customer(cid, name, dob, email, mid, m_st_date)
values (cid_seq.nextval, 'cust3', add_months(trunc(sysdate), -11*20), 'cust3@gmail.com', 3, to_date('05/25/2018', 'MM/DD/YYYY'));
insert into customer(cid, name, dob, email, mid, m_st_date)
values (cid_seq.nextval, 'cust4', add_months(trunc(sysdate), -12*20), 'cust4@gmail.com', 2, to_date('03/20/2015', 'MM/DD/YYYY'));
insert into customer(cid, name, dob, email, mid, m_st_date)
values (cid_seq.nextval, 'cust5', add_months(trunc(sysdate), -13*20), 'cust5@gmail.com', 2, to_date('06/12/2009', 'MM/DD/YYYY'));
insert into customer(cid, name, dob, email, mid, m_st_date)
values (cid_seq.nextval, 'cust6', add_months(trunc(sysdate), -14*20), 'cust6@gmail.com', 2, to_date('08/10/2010', 'MM/DD/YYYY'));
insert into customer(cid, name, dob, email, mid, m_st_date)
values (cid_seq.nextval, 'cust7', add_months(trunc(sysdate), -15*20), 'cust7@gmail.com', 1, to_date('01/31/2011', 'MM/DD/YYYY'));
insert into customer(cid, name, dob, email, mid, m_st_date)
values (cid_seq.nextval, 'cust8', add_months(trunc(sysdate), -16*20), 'cust8@gmail.com', 3, to_date('11/25/2017', 'MM/DD/YYYY'));
insert into customer(cid, name, dob, email, mid, m_st_date)
values (cid_seq.nextval, 'cust9', add_months(trunc(sysdate), -17*20), 'cust9@gmail.com', 3, to_date('11/14/2014', 'MM/DD/YYYY'));
insert into customer(cid, name, dob, email, mid, m_st_date)
values (cid_seq.nextval, 'cust10', add_months(trunc(sysdate), -17*19), 'cust10@gmail.com', 2, to_date('12/16/2014', 'MM/DD/YYYY'));
insert into customer(cid, name, dob, email, mid, m_st_date)
values (cid_seq.nextval, 'cust11', add_months(trunc(sysdate), -17*18), 'cust11@gmail.com', 1, to_date('04/17/2014', 'MM/DD/YYYY'));
insert into customer(cid, name, dob, email, mid, m_st_date)
values (cid_seq.nextval, 'cust12', add_months(trunc(sysdate), -17*17), 'cust12@gmail.com', 2, to_date('09/11/2014', 'MM/DD/YYYY'));
insert into customer(cid, name, dob, email, mid, m_st_date)
values (cid_seq.nextval, 'cust13', add_months(trunc(sysdate), -17*15), 'cust13@gmail.com', 2, to_date('12/09/2014', 'MM/DD/YYYY'));
insert into customer(cid, name, dob, email, mid, m_st_date)
values (cid_seq.nextval, 'cust14', add_months(trunc(sysdate), -17*13), 'cust14@gmail.com', 3, to_date('05/02/2014', 'MM/DD/YYYY'));
insert into customer(cid, name, dob, email, mid, m_st_date)
values (cid_seq.nextval, 'cust15', add_months(trunc(sysdate), -17*12), 'cust15@gmail.com', 1, to_date('02/14/2014', 'MM/DD/YYYY'));
insert into customer(cid, name, dob, email, mid, m_st_date)
values (cid_seq.nextval, 'cust16', add_months(trunc(sysdate), -17*11), 'cust16@gmail.com', 3, to_date('04/18/2014', 'MM/DD/YYYY'));
--insert more customer data

create sequence ctid_seq;
insert into cart(ctid, date_created, cid, eid)
values (ctid_seq.nextval, to_date('11/25/2022', 'MM/DD/YYYY'), 3, 4); 
INSERT INTO cart(ctid, date_created, cid, eid)
VALUES (ctid_seq.nextval, TO_DATE('11/25/2022', 'MM/DD/YYYY'), 3, 4);
INSERT INTO cart(ctid, date_created, cid, eid)
VALUES (ctid_seq.nextval, TO_DATE('11/26/2022', 'MM/DD/YYYY'), 4, 6);
INSERT INTO cart(ctid, date_created, cid, eid)
VALUES (ctid_seq.nextval, TO_DATE('11/27/2022', 'MM/DD/YYYY'), 5, 6);
INSERT INTO cart(ctid, date_created, cid, eid)
VALUES (ctid_seq.nextval, TO_DATE('11/28/2022', 'MM/DD/YYYY'), 6, 4);
INSERT INTO cart(ctid, date_created, cid, eid)
VALUES (ctid_seq.nextval, TO_DATE('11/29/2022', 'MM/DD/YYYY'), 7, 7);
INSERT INTO cart(ctid, date_created, cid, eid)
VALUES (ctid_seq.nextval, TO_DATE('11/30/2022', 'MM/DD/YYYY'), 8, 12);
INSERT INTO cart(ctid, date_created, cid, eid)
VALUES (ctid_seq.nextval, TO_DATE('12/01/2022', 'MM/DD/YYYY'), 9, 12);
INSERT INTO cart(ctid, date_created, cid, eid)
VALUES (ctid_seq.nextval, TO_DATE('12/02/2022', 'MM/DD/YYYY'), 10, 12);
INSERT INTO cart(ctid, date_created, cid, eid)
VALUES (ctid_seq.nextval, TO_DATE('12/03/2022', 'MM/DD/YYYY'), 11, 11);
INSERT INTO cart(ctid, date_created, cid, eid)
VALUES (ctid_seq.nextval, TO_DATE('12/04/2022', 'MM/DD/YYYY'), 12, 12);
-- more cart data

create sequence sid_seq;
insert into supplier(sid, name, shipping_company, contact_information)
values (sid_seq.nextval, 'supplier1', 'tropicana', 'sup1@gmail.com');
insert into supplier(sid, name, shipping_company, contact_information)
values (sid_seq.nextval, 'supplier2', 'coca-cola', 'sup2@gmail.com');
insert into supplier(sid, name, shipping_company, contact_information)
values (sid_seq.nextval, 'supplier3', 'oreo', 'sup3@gmail.com');
insert into supplier(sid, name, shipping_company, contact_information)
values (sid_seq.nextval, 'supplier4', 'lays', 'sup4@gmail.com');
insert into supplier(sid, name, shipping_company, contact_information)
values (sid_seq.nextval, 'supplier5', 'marketBasket', 'sup5@gmail.com');
insert into supplier(sid, name, shipping_company, contact_information)
values (sid_seq.nextval, 'supplier6', 'costco', 'sup6@gmail.com');
insert into supplier(sid, name, shipping_company, contact_information)
values (sid_seq.nextval, 'supplier7', 'aldi', 'sup7@gmail.com');
-- more supplier data

create sequence iid_seq;
select * from inventory;
insert into inventory(iid, name, description, costprice, quantity, perishable, expiration_date, purchasePrice, sid)
values (iid_seq.nextval,'pizza', 'description1', 40, 15, 'Y', sysdate+10, 20, 1);
insert into inventory(iid, name, description, costprice, quantity, perishable, expiration_date, purchasePrice,  sid)
values (iid_seq.nextval,'milk', 'description2', 30, 15, 'Y', sysdate+8, 20, 2);
insert into inventory(iid, name, description, costprice, quantity, perishable, expiration_date, purchasePrice, sid)
values (iid_seq.nextval,'pastry', 'description3', 33, 15, 'Y', sysdate+7,15, 1);
insert into inventory(iid, name, description, costprice, quantity, perishable, expiration_date, purchasePrice,  sid)
values (iid_seq.nextval,'cake', 'description4', 90, 15, 'Y', sysdate+14,80, 3);
insert into inventory(iid, name, description, costprice, quantity, perishable, expiration_date, purchasePrice, sid)
values (iid_seq.nextval,'veggies', 'description5', 40, 15, 'Y', sysdate+20,25, 3);
insert into inventory(iid, name, description, costprice, quantity, perishable, expiration_date, purchasePrice, sid)
values (iid_seq.nextval,'fruits', 'description6', 85, 15, 'Y', sysdate+100,70, 2);
insert into inventory(iid, name, description, costprice, quantity, perishable, expiration_date, purchasePrice, sid)
values (iid_seq.nextval,'chocolate', 'description7', 50, 15, 'Y', sysdate+60,30, 1);
insert into inventory(iid, name, description, costprice, quantity, perishable, expiration_date, purchasePrice,  sid)
values (iid_seq.nextval,'toothpaste', 'description8', 100, 15, 'Y', sysdate+240,90, 2);
insert into inventory(iid, name, description, costprice, quantity, perishable, expiration_date, purchasePrice,  sid)
values (iid_seq.nextval,'cocacola', 'description9', 60, 15, 'Y', sysdate+7, 55, 1);
insert into inventory(iid, name, description, costprice, quantity, perishable, expiration_date, purchasePrice,  sid)
values (iid_seq.nextval,'shampoo', 'description10', 20, 15, 'Y', sysdate+180,5, 1);
-- more inventory data

insert into cart_details(ctid, iid, quantity)
values (1, 8, 2);
update cart_details set salesPrice = (
select (i.costPrice) - (m.benefits * i.costPrice)/100
from membership m 
join customer c on m.mid = c.mid 
join cart cr on c.cid = cr.cid 
join cart_details cd on cd.ctid = cr.ctid 
join inventory i on cd.iid = i.iid where i.iid = 8 and cd.ctid = 1 and c.mid is not null
)
where iid = 8 and ctid = 1;
update inventory set quantity = (select quantity from inventory where inventory.iid = 8) - 2 where iid=8; 
------------------

insert into cart_details(ctid, iid, quantity)
values (1, 4, 4);
update cart_details set salesPrice = (
select 
(i.costPrice) - (m.benefits * i.costPrice)/100
from membership m 
join customer c on m.mid = c.mid 
join cart cr on c.cid = cr.cid 
join cart_details cd on cd.ctid = cr.ctid 
join inventory i on cd.iid = i.iid where i.iid = 4 and cd.ctid = 1 and c.mid is not null
)
where iid = 4 and ctid = 1;
update inventory set quantity = (select quantity from inventory where inventory.iid = 4) - 4 where iid=4;



insert into cart_details(ctid, iid, quantity)
values (1, 1, 1);
update cart_details set salesPrice = (
select (i.costPrice) - (m.benefits * i.costPrice)/100
from membership m 
join customer c on m.mid = c.mid 
join cart cr on c.cid = cr.cid 
join cart_details cd on cd.ctid = cr.ctid 
join inventory i on cd.iid = i.iid where i.iid = 1 and cd.ctid = 1 and c.mid is not null)
where iid = 1 and ctid = 1;
update inventory set quantity = (select quantity from inventory where inventory.iid = 1) - 1 where iid=1; 


insert into cart_details(ctid, iid, quantity)
values (2, 6, 5);
update cart_details set salesPrice = (
select (i.costPrice) - (m.benefits * i.costPrice)/100
from membership m 
join customer c on m.mid = c.mid 
join cart cr on c.cid = cr.cid 
join cart_details cd on cd.ctid = cr.ctid 
join inventory i on cd.iid = i.iid where i.iid = 6 and cd.ctid = 2 and c.mid is not null)
where iid = 6 and ctid = 2;
update inventory set quantity = (select quantity from inventory where inventory.iid = 6) - 5 where iid=6; 


insert into cart_details(ctid, iid, quantity)
values (3, 4, 2);
update cart_details set salesPrice = (
select (i.costPrice) - (m.benefits * i.costPrice)/100
from membership m 
join customer c on m.mid = c.mid 
join cart cr on c.cid = cr.cid 
join cart_details cd on cd.ctid = cr.ctid 
join inventory i on cd.iid = i.iid where i.iid = 4 and cd.ctid = 3 and c.mid is not null)
where iid = 4 and ctid = 3;
update inventory set quantity = (select quantity from inventory where inventory.iid = 4) - 2 where iid=4; 



insert into cart_details(ctid, iid, quantity)
values (3, 2, 3);
update cart_details set salesPrice = (
select (i.costPrice) - (m.benefits * i.costPrice)/100
from membership m 
join customer c on m.mid = c.mid 
join cart cr on c.cid = cr.cid 
join cart_details cd on cd.ctid = cr.ctid 
join inventory i on cd.iid = i.iid where i.iid = 2 and cd.ctid = 3 and c.mid is not null)
where iid = 2 and ctid = 3;
update inventory set quantity = (select quantity from inventory where inventory.iid = 2) - 3 where iid=2; 



insert into cart_details(ctid, iid, quantity)
values (4, 6, 5);
update cart_details set salesPrice = (
select (i.costPrice) - (m.benefits * i.costPrice)/100
from membership m 
join customer c on m.mid = c.mid 
join cart cr on c.cid = cr.cid 
join cart_details cd on cd.ctid = cr.ctid 
join inventory i on cd.iid = i.iid where i.iid = 6 and cd.ctid = 4 and c.mid is not null)
where iid = 6 and ctid = 4;
update inventory set quantity = (select quantity from inventory where inventory.iid = 6) - 5 where iid=6; 


insert into cart_details(ctid, iid, quantity)
values (4, 7, 4);
update cart_details set salesPrice = (
select (i.costPrice) - (m.benefits * i.costPrice)/100
from membership m 
join customer c on m.mid = c.mid 
join cart cr on c.cid = cr.cid 
join cart_details cd on cd.ctid = cr.ctid 
join inventory i on cd.iid = i.iid where i.iid = 7 and cd.ctid = 4 and c.mid is not null)
where iid = 7 and ctid = 4;
update inventory set quantity = (select quantity from inventory where inventory.iid = 7) - 4 where iid=7; 


insert into cart_details(ctid, iid, quantity)
values (5, 2, 3);
update cart_details set salesPrice = (
select (i.costPrice) - (m.benefits * i.costPrice)/100
from membership m 
join customer c on m.mid = c.mid 
join cart cr on c.cid = cr.cid 
join cart_details cd on cd.ctid = cr.ctid 
join inventory i on cd.iid = i.iid where i.iid = 2 and cd.ctid = 5 and c.mid is not null)
where iid = 2 and ctid = 5;
update inventory set quantity = (select quantity from inventory where inventory.iid = 2) - 3 where iid=2; 



insert into cart_details(ctid, iid, quantity)
values (6, 4, 2);
update cart_details set salesPrice = (
select (i.costPrice) - (m.benefits * i.costPrice)/100
from membership m 
join customer c on m.mid = c.mid 
join cart cr on c.cid = cr.cid 
join cart_details cd on cd.ctid = cr.ctid 
join inventory i on cd.iid = i.iid where i.iid = 4 and cd.ctid = 6 and c.mid is not null)
where iid = 4 and ctid = 6;
update inventory set quantity = (select quantity from inventory where inventory.iid = 4) - 2 where iid=4; 



insert into cart_details(ctid, iid, quantity)
values (6, 5, 4);
update cart_details set salesPrice = (
select (i.costPrice) - (m.benefits * i.costPrice)/100
from membership m 
join customer c on m.mid = c.mid 
join cart cr on c.cid = cr.cid 
join cart_details cd on cd.ctid = cr.ctid 
join inventory i on cd.iid = i.iid where i.iid = 5 and cd.ctid = 6 and c.mid is not null)
where iid = 5 and ctid = 6;
update inventory set quantity = (select quantity from inventory where inventory.iid = 5) - 4 where iid=5; 



insert into cart_details(ctid, iid, quantity)
values (7, 3, 4);
update cart_details set salesPrice = (
select (i.costPrice) - (m.benefits * i.costPrice)/100
from membership m 
join customer c on m.mid = c.mid 
join cart cr on c.cid = cr.cid 
join cart_details cd on cd.ctid = cr.ctid 
join inventory i on cd.iid = i.iid where i.iid = 3 and cd.ctid = 7 and c.mid is not null)
where iid = 3 and ctid = 7;
update inventory set quantity = (select quantity from inventory where inventory.iid = 3) - 4 where iid=7; 


insert into cart_details(ctid, iid, quantity)
values (10, 9, 6);
update cart_details set salesPrice = (
select (i.costPrice) - (m.benefits * i.costPrice)/100
from membership m 
join customer c on m.mid = c.mid 
join cart cr on c.cid = cr.cid 
join cart_details cd on cd.ctid = cr.ctid 
join inventory i on cd.iid = i.iid where i.iid = 9 and cd.ctid = 10 and c.mid is not null)
where iid = 9 and ctid = 10;
update inventory set quantity = (select quantity from inventory where inventory.iid = 9) - 6 where iid=9; 


create sequence tid_seq;
insert into transactions(tid, total_payment, payment_details, ctid)
values(tid_seq.nextval,(select sum(salesprice*quantity) from cart_details join cart on cart.ctid = cart_details.ctid where cart_details.ctid = 1 group by cart_details.ctid), 'bofa', 1); 
insert into transactions(tid, total_payment, payment_details, ctid)
values(tid_seq.nextval,(select sum(salesprice*quantity) from cart_details join cart on cart.ctid = cart_details.ctid where cart_details.ctid = 2 group by cart_details.ctid), 'bofa', 2); 
insert into transactions(tid, total_payment, payment_details, ctid)
values(tid_seq.nextval,(select sum(salesprice*quantity) from cart_details join cart on cart.ctid = cart_details.ctid where cart_details.ctid = 3 group by cart_details.ctid), 'bofa', 3);
insert into transactions(tid, total_payment, payment_details, ctid)
values(tid_seq.nextval,(select sum(salesprice*quantity) from cart_details join cart on cart.ctid = cart_details.ctid where cart_details.ctid = 4 group by cart_details.ctid), 'bofa', 4); 
insert into transactions(tid, total_payment, payment_details, ctid)
values(tid_seq.nextval,(select sum(salesprice*quantity) from cart_details join cart on cart.ctid = cart_details.ctid where cart_details.ctid = 5 group by cart_details.ctid), 'bofa', 5); 
insert into transactions(tid, total_payment, payment_details, ctid)
values(tid_seq.nextval,(select sum(salesprice*quantity) from cart_details join cart on cart.ctid = cart_details.ctid where cart_details.ctid = 6 group by cart_details.ctid), 'bofa', 6);
insert into transactions(tid, total_payment, payment_details, ctid)
values(tid_seq.nextval,(select sum(salesprice*quantity) from cart_details join cart on cart.ctid = cart_details.ctid where cart_details.ctid = 7 group by cart_details.ctid), 'bofa', 7); 
insert into transactions(tid, total_payment, payment_details, ctid)
values(tid_seq.nextval,(select sum(salesprice*quantity) from cart_details join cart on cart.ctid = cart_details.ctid where cart_details.ctid = 10 group by cart_details.ctid), 'bofa', 10); 

select * from cart_details;