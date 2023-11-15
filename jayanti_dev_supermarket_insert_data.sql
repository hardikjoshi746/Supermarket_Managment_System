-- if you run this file with script button it wont work for all the values as some values were hardcoded with wrong indexes. not sure. so some ids will be 1 instead of 
-- 2 or 3. i had to do that because i ran the sequence individually so the nextval increased. 
truncate table customer; --
drop sequence cid_seq;
truncate table membership; --
drop sequence mid_seq;
truncate table cart; --
drop sequence ctid_seq;
truncate table employee; --
drop sequence eid_seq;
truncate table inventory;
drop sequence iid_seq;
truncate table cart_details;
truncate table transactions;
drop sequence tid_seq;
truncate table supplier;
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
values (eid_seq.nextval, 'stck1', add_months(trunc(sysdate), -10), 'Stocker', 8000.00, 3);
-- insert more employee data

create sequence mid_seq;
insert into membership(mid, name, pricepermonth, benefits)
values (mid_seq.nextval, '10%off', 5, 10);
-- insert more membership data

create sequence cid_seq;
insert into customer(cid, name, dob, email, mid, m_st_date)
values (cid_seq.nextval, 'cust1', add_months(trunc(sysdate), -10*20), 'cust1@gmail.com', 1, to_date('11/25/2007', 'MM/DD/YYYY'));
--insert more customer data

create sequence ctid_seq;
insert into cart(ctid, date_created, cid, eid)
values (ctid_seq.nextval, to_date('11/25/2022', 'MM/DD/YYYY'), 3, 1); 
-- more cart data

create sequence sid_seq;
insert into supplier(sid, name, shipping_company, contact_information)
values (sid_seq.nextval, 'supplier1', 'fedex', 'sup@gmail.com');
-- more supplier data

create sequence iid_seq;
select * from inventory;
insert into inventory(iid, name, description, costprice, quantity, perishable, expiration_date, sid)
values (iid_seq.nextval,'pizza', 'frozen pizza', 10, 15, 'Y', sysdate+10,1);
-- more inventory data

insert into cart_details(ctid, iid, salesprice, quantity)
values (2, 1, 20, 2);
-- more cart_details data

select * from transactions;
create sequence tid_seq;
insert into transactions(tid, total_payment, payment_details, ctid)
values(tid_seq.nextval, 100, 'bofa', 2); -- will have to calculate total_payment. Just inputted random value for now.