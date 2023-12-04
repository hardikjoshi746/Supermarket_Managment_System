set serveroutput on;

BEGIN
for myobject in (
        with myObjects as (
            select 'CART_DETAILS' Oname from dual
            union all 
            select 'TRANSACTIONS' from dual
            union all 
            select 'TID_SEQ' from dual
            union all 
            select 'INVENTORY' from dual
            union all 
            select 'IID_SEQ' from dual
            union all 
            select 'SUPPLIER' from dual
            union all 
            select 'SID_SEQ' from dual
            union all  
            select 'CART' from dual
            union all 
            select 'CTID_SEQ' from dual
            union all 
            select 'CUSTOMER' from dual
            union all 
            select 'CID_SEQ' from dual
            union all 
            select 'EMPLOYEE' from dual
            union all 
            select 'EID_SEQ' from dual
            union all 
            select 'MEMBERSHIP' from dual
            union all 
            select 'MID_SEQ' from dual
        )
        
        select mo.Oname, uo.object_type from myObjects mo inner join user_objects uo on mo.Oname = uo.object_name
    )
  LOOP
    dbms_output.put_line('--------------');
    DBMS_OUTPUT.PUT_LINE( 'object name to be dropped' || myobject.oName);
    execute immediate 'drop ' || myobject.object_type || ' ' || myobject.Oname;
  END LOOP;
  
  EXCEPTION
    when others then 
        dbms_output.put_line('not dropping: ');
        dbms_output.put_line(sqlerrm);
END;
/
create sequence mid_seq;
create table MEMBERSHIP(
    mid number primary key,
    name varchar2(25) unique not null,
    pricePerMonth number(5,2) not null,
    benefits number(5,2) not null
);

insert into membership(mid, name, pricepermonth, benefits)
values (mid_seq.nextval, '10%off', 5, 10);
insert into membership(mid, name, pricepermonth, benefits)
values (mid_seq.nextval, '15%off', 10, 15);
insert into membership(mid, name, pricepermonth, benefits)
values (mid_seq.nextval, '20%off', 17, 20);

create sequence cid_seq;
create table CUSTOMER (
    cid number primary key, 
    name varchar2(50),
    dob date,
    email varchar2(50) unique not null,
    mid number references membership(mid) on delete set null,
    m_st_date date --TODO
);

create sequence eid_seq;
create table EMPLOYEE (
    eid number primary key,
    name varchar2(50) not null,
    hire_date date not null,
    type varchar2(50) not null check(type in ('Cashier', 'Manager', 'Stocker', 'Storemanager')),
    salary number(7,2) not null,
    reports_to number references employee(eid) on delete set null
);

insert into employee(eid, name, hire_date, type, salary, reports_to)
values (eid_seq.nextval, 'sup1', add_months(trunc(sysdate), -12), 'Storemanager', 10000.00, null);
insert into employee(eid, name, hire_date, type, salary, reports_to)
values (eid_seq.nextval, 'mng1', add_months(trunc(sysdate), -11), 'Manager', 8000.00, 1);
insert into employee(eid, name, hire_date, type, salary, reports_to)
values (eid_seq.nextval, 'mng2', add_months(trunc(sysdate), -10), 'Manager', 8000.00, 1);

create sequence ctid_seq;
create table CART (
    ctid number primary key,
    date_created date not null,
    cid number references customer(cid) on delete cascade,
    eid number references employee(eid) on delete set null
);

create sequence tid_seq;
create table TRANSACTIONS (
    tid number primary key,
    total_payment number(7,2) not null,
    payment_details varchar2(50) not null,
    ctid number references cart(ctid) on delete cascade
);

create sequence sid_seq;
create table SUPPLIER (
    sid number primary key,
    name varchar2(50) unique not null,
    shipping_company varchar2(50), 
    contact_information varchar2(50)
);
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

create sequence iid_seq;
create table INVENTORY (
    iid number primary key,
    name varchar2(50) unique not null,
    description varchar2(100),
    costPrice number(6,2) not null,
    quantity number not null check(quantity > 0),
    perishable char(1) default 'N' not null ,
    expiration_date date,  -- if expiration date over sysdate order new product
    purchasePrice number(6,2) not null,
    sid number references supplier(sid) on delete set null not null
);

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

create table CART_DETAILS (
    ctid number references cart(ctid) on delete cascade not null,
    iid number references inventory(iid) on delete cascade not null,
    salesPrice number(6,2) default 0 not null,
    quantity number not null,
    constraint pk_cart_details PRIMARY KEY (ctid, iid)
);
