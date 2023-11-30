desc employee;
set serveroutput on;
create or replace procedure hire_employee(pi_name employee.name%type, pi_type employee.type%type, pi_salary employee.salary%type, pi_reports_to employee.reports_to%type)
as
begin
    insert into employee values (eid_seq.nextval, pi_name, sysdate, pi_type, salary, reports_to);
exception
    when others then 
        dbms_output.put_line(SQLERRM);
end hire_employee;
/

create or replace procedure add_customer(pi_name customer.name%type, pi_dob customer.dob%type, pi_email customer.email%type, pi_membership varchar2, pi_m_st_date customer.m_st_date%type)
as
e_st_date_without_membership exception;
v_mid varchar2(25);
begin
    select mid into v_mid from membership where name = pi_membership;
    if v_mid is null and m_st_date is not null then
        raise e_st_date_without_membership;
    end if;
    insert into customer values(cid_seq.nextval, pi_name, pi_dob, pi_email, v_mid, m_st_date);
exception
    when e_st_date_without_membership then
        dbms_output.put_line('no start date without membership');
    when no_data_found then
        dbms_output.put_line('no such membership');
end add_customer;
/

create or replace procedure update_customer_membership_status(pi_cid customer.cid%type, pi_membership varchar2, pi_m_st_date customer.m_st_date%type default sysdate)
as
e_st_date_without_membership exception;
v_mid varchar2(25);
begin
    select mid into v_mid from membership where name = pi_membership;
    update customer set mid = v_mid, m_st_date = pi_m_st_date
    where cid = pi_cid;
exception
    when no_data_found then
        dbms_output.put_line('no such membership');
end update_customer;
/

desc inventory;
create or replace procedure update_inventory(pi_name varchar, pi_description varchar, pi_costprice number, pi_quantity number, pi_perishable char, pi_expiration_date date, pi_purchaseprice number, pi_sid  number)
as
v_exists varchar(1):='N';
v_name varchar2(50);
v_description varchar2(100);
v_costprice number(6,2);
v_quantity number;
v_perishable char;
v_expiration_date date;
v_purchaseprice number(6,2);
v_sid number;
e_expired_product exception;
e_costprice_invalid exception;
e_quantity_invalid exception;
e_update_invalid exception;
begin
    select 'Y' into v_exists from inventory where name = pi_name;
    if pi_name is null then 
        select name into v_name from inventory where iid = v_iid;
    else 
        v_name := pi_name;
    end if;
    
    if pi_description is null then 
        select description into v_description from inventory where iid = v_iid;
    else
        v_description := pi_description;
    end if;
    
    if pi_purchaseprice is null then 
        select purchaseprice into v_purchaseprice where iid = v_iid;
    else 
        v_purchaseprice := pi_purchaseprice;
    end if;
    
    if pi_costprice is null then
        select costprice into v_costprice from inventory where iid = v_iid;
    elsif pi_costprice < v_purchaseprice then 
        raise e_costprice_invalid;
    else 
        v_costprice := pi_costprice;
    end if;
    
    if pi_quantity is null then 
        select quantity into v_quantity from inventory where iid = v_iid;
    elsif pi_quantity <= 0 then
        raise e_quantity_invalid;
    else 
        v_quantity := pi_quantity;
    end if;
    
    if pi_perishable is null then 
        select perishable into v_perishable from inventory where iid = v_iid;
    else 
        v_perishable := pi_perishable;
    end if;
    
    if pi_expiration_date is null then 
        select expiration_date into v_expiration_date from inventory where iid = v_iid;
    elsif (pi_expiration_date <= sysdate) then
        raise e_expired_product; 
    else 
        v_expiration_date := pi_expiration_date;
    end if;
    
    
    
    if pi_sid is null then
        select sid into v_sid from inventory where iid = v_iid;
    else
        v_sid := pi_sid;
    end if;
    if v_exists = 'N' then 
        insert into inventory(iid, name, description, costprice, quantity, perishable, expiration_date, purchaseprice, sid) 
        values (iid_seq.nextval, pi_name, pi_description, pi_costprice, pi_quantity, pi_perishable, pi_expiration_date, pi_purchaseprice, pi_sid);
    else 
        update inventory set name = v_name,description = v_description, costprice = v_costprice, quantity = v_quantity, expiration_date = v_expiration_date, purchaseprice = v_purchaseprice
        where iid = v_iid;
    end if;
    if sql%rowcount > 1 then 
        rollback;
        raise e_update_invalid;
    else
        commit;
    end if;
exception
    when others then 
        dbms_output.put_line('');
--    todo handle exceptions
end insert_new_inventory;
/
desc cart;
desc cart_details;
desc transactions;
desc inventory;


create or replace package place_order
as 
function create_cart(cid number, eid number) return number;
procedure add_item_to_cart(pi_cart_id number, pi_inventory_name varchar, pi_quantity number);
procedure add_payment_for_cart(pi_cart_id number, pi_total_payment number, pi_payment_details varchar);
end;
/

create or replace package body place_order 
as 
create or replace function create_cart(cid number, eid number)
return number 
as
begin     
    insert into cart values as(ctid_seq.nextval, sysdate, cid, eid);
    return ctid_seq.currval;
exception 
    when others then
        dbms_output.put_line(SQLERRM);
end create_cart;
/


create or replace procedure place_order(
pi_ctid number,
pi_inventory_name varchar2,
pi_quantity number
) 
as 
v_iid number; 
v_quantity number;
v_saleprice number;
e_inventory_not_exist exception;
e_not_enough_inventory exception;
begin
    select iid, quantity into v_iid, v_quantity from inventory where name = pi_inventory_name;
    if quantity <= 0 then 
        raise e_inventory_not_exist;
    end if;
    
    select (i.costPrice) - (m.benefits * i.costPrice)/100 into v_salesPrice
    from membership m 
    join customer c on m.mid = c.mid 
    join cart cr on c.cid = cr.cid 
    join cart_details cd on cd.ctid = cr.ctid 
    join inventory i on cd.iid = i.iid where i.iid = v_iid and cd.ctid = ctid_seq.currval and c.mid is not null;

    if v_quantity - pi_quantity < 0 then
        raise e_not_enough_inventory;
    end if;
    
exception 
    when others then 
        dbms_output.put_line();
end place_order;


