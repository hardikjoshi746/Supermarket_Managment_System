set serveroutput on;
select * from user_objects;

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

create sequence cid_seq;
create table CUSTOMER (
    cid number primary key, 
    name varchar2(50),
    dob date,
    email varchar2(50),
    mid number references membership(mid) on delete set null,
    m_st_date date --TODO
);

create sequence eid_seq;
create table EMPLOYEE (
    eid number primary key,
    name varchar2(50) not null,
    hire_date date not null,
    type varchar2(50) not null check(type in ('Cashier', 'Manager', 'Stocker', 'Supervisor')),
    salary number(7,2) not null,
    reports_to number references employee(eid) on delete set null
);

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

create sequence iid_seq;
create table INVENTORY (
    iid number primary key,
    name varchar2(50) not null,
    description varchar2(100),
    costPrice number(6,2) not null,
    quantity number not null,
    perishable char(1) default 'N' not null ,
    expiration_date date,  
    discount number(5,2) default 0,
    sid number references supplier(sid) on delete set null
);

create table CART_DETAILS (
    ctid number references cart(ctid) on delete cascade not null,
    iid number references inventory(iid) on delete cascade not null,
    salesPrice number(6,2) not null,
    quantity number not null,
    constraint pk_cart_details PRIMARY KEY (ctid, iid)
);
