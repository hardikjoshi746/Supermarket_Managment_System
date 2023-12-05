--TODO more procedure ideas: update employee - change reports_to or salary or type, update customer 
set serveroutput on;
create or replace procedure hire_employee(pi_name employee.name%type, pi_type varchar, pi_salary employee.salary%type, pi_reports_to employee.reports_to%type)
as
begin
    insert into employee values (eid_seq.nextval, pi_name, sysdate, pi_type, pi_salary, pi_reports_to);
    commit;
exception
    when others then 
        dbms_output.put_line(SQLERRM);
end hire_employee;
/

create or replace procedure add_customer(pi_name customer.name%type, pi_dob customer.dob%type, pi_email customer.email%type, pi_membership varchar2, pi_m_st_date customer.m_st_date%type)
as
v_mid varchar2(25);
begin
    select mid into v_mid from membership where name = pi_membership;
    insert into customer values(cid_seq.nextval, pi_name, pi_dob, pi_email, v_mid, pi_m_st_date);
    commit;
exception
    when no_data_found then
        dbms_output.put_line('no such membership');
    when others then
        dbms_output.put_line(SQLERRM);
end add_customer;
/

create or replace procedure update_customer_membership_status(pi_cid customer.cid%type, pi_membership varchar2, pi_m_st_date customer.m_st_date%type default sysdate)
as
v_mid varchar2(25);
begin
    select mid into v_mid from membership where name = pi_membership;
    
    update customer set mid = v_mid, m_st_date = pi_m_st_date
    where cid = pi_cid;
    
    if sql%rowcount >1 then
        rollback;
    else
        commit;
    end if;
exception
    when no_data_found then
        dbms_output.put_line('no such membership');
end update_customer_membership_status;
/

--desc inventory;
create or replace procedure update_inventory(pi_name varchar, pi_description varchar, pi_costprice number, pi_quantity number, pi_perishable char, pi_expiration_date date, pi_purchaseprice number, pi_sid  number)
as
v_iid number;
v_exists varchar(1):= 'N';
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
E_PRODUCT_NON_EXPIRABLE exception;
begin
    select 'Y', iid into v_exists, v_iid from inventory where name = pi_name;
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
        select purchaseprice into v_purchaseprice from inventory where iid = v_iid;
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
    
    select quantity into v_quantity from inventory where iid = v_iid;
    
    if pi_quantity is null then 
        v_quantity := pi_quantity;
    elsif pi_quantity <= 0 then
        raise e_quantity_invalid;
    else
        dbms_output.put_line('works');
        v_quantity := pi_quantity;
    end if;
    
    if pi_perishable is null then 
        select perishable into v_perishable from inventory where iid = v_iid;
    elsif pi_perishable = 'N' and pi_expiration_date is not null then
        raise e_product_non_expirable;
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
    
    if v_exists = 'Y' then 
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
    when e_costprice_invalid then 
        dbms_output.put_line('item cannot be sold at loss. Cost price should be greater than purchase price');
    when e_quantity_invalid then 
        dbms_output.put_line('quantity cannot be zero or negative');
    when e_expired_product then
        dbms_output.put_line('item is past expiry date. Buy new product');
    when e_update_invalid then
        dbms_output.put_line('updating too many rows. check inventory again');
    when E_PRODUCT_NON_EXPIRABLE then 
        dbms_output.put_line('product will not perish. hence no expiration date');
    when no_data_found then
        dbms_output.put_line('No such inventory');
    when others then 
        dbms_output.put_line(SQLERRM);
end update_inventory;
/

desc inventory;
create or replace procedure insert_new_inventory(pi_name varchar, pi_description varchar, pi_costprice number, pi_quantity number, pi_perishable char, pi_expiration_date date, pi_purchase_price number, pi_sid number)
as 
e_expired_product exception;
e_costprice_lesser_than_purchaseprice exception;
e_invalid_quantity exception;
e_product_non_expirable exception;
begin
    if pi_expiration_date <= sysdate then 
        raise e_expired_product;
    end if;
    
    if pi_perishable = 'N' and pi_expiration_date is not null then
        raise e_product_non_expirable;
    end if;
    
    if pi_purchase_price > pi_costprice then
        raise e_costprice_lesser_than_purchaseprice;
    end if;
    
    if pi_quantity <= 0 then
        raise e_invalid_quantity;
    end if;
    insert into inventory values(iid_seq.nextval, pi_name, pi_description, pi_costprice, pi_quantity, pi_perishable, pi_expiration_Date, pi_purchase_price, pi_sid);
    commit;
exception
    when e_expired_product then 
        dbms_output.put_line('product is expired');
    when e_costprice_lesser_than_purchaseprice then
        dbms_output.put_line('cannot sell at a loss');
    when e_invalid_quantity then 
        dbms_output.put_line('quantity cannot be less than or equal zero');
    when e_product_non_expirable then 
        dbms_output.put_line('product will not perish. hence no expiration date');
    when others then
        dbms_output.put_line(SQLERRM);
end insert_new_inventory;
/


create or replace package place_order
as 
function create_cart(pi_cid number,pi_date date default sysdate, pi_eid number) return number;
procedure add_item_to_cart(pi_ctid number, pi_inventory_name varchar, pi_quantity number);
procedure add_payment_for_cart(pi_cart_id number, pi_payment_details varchar);
end;
/

create or replace package body place_order 
as 
--function to initialise cart place_order.create_cart(1, 2)
function create_cart(pi_cid number, pi_date date default sysdate, pi_eid number)
return number 
as
begin  
    insert into cart values (ctid_seq.nextval, pi_date, pi_cid, pi_eid);
    commit;
    return ctid_seq.currval;
exception 
    when others then
        dbms_output.put_line(SQLERRM);
end create_cart;
--procedure to call to add items to cart place_order.add_items(2, 'pizza'), place_order.add_items(2, 'milk')
procedure add_item_to_cart(
pi_ctid number,
pi_inventory_name varchar,
pi_quantity number
) 
as 
v_ctid number;
v_iid number; 
v_costPrice number;
v_quantity number;
v_salesprice number;
e_inventory_not_exist exception;
e_not_enough_inventory exception;
begin
    select iid, quantity, costPrice into v_iid, v_quantity, v_costPrice from inventory where name = pi_inventory_name;
    if v_quantity <= 0 then 
        raise e_inventory_not_exist;
    end if;
    
    select (v_costPrice) - (m.benefits * v_costPrice)/100 into v_salesprice
    from membership m 
    join customer c on m.mid = c.mid 
    join cart cr on c.cid = cr.cid 
    where cr.ctid = pi_ctid and c.mid is not null;

    if v_quantity - pi_quantity < 0 then
        raise e_not_enough_inventory;
    else 
        update inventory set quantity = v_quantity - pi_quantity where iid = v_iid;
        insert into cart_details values (pi_ctid, v_iid, v_salesPrice, pi_quantity); 
        commit;
    end if;
    
exception 
    when no_data_found then 
        dbms_output.put_line('data was not found for this entry. Please check if you have inputted parameters correctly');
    when too_many_rows then 
        dbms_output.put_line('why is this happening');
    when e_inventory_not_exist then
        dbms_output.put_line('item not found');
    when e_not_enough_inventory then 
        dbms_output.put_line('not enough quantity in inventory');
    when others then 
        dbms_output.put_line(SQLERRM);

end add_item_to_cart;
--proceudre to call when setting up payment information for that particular cart place_order.add_payment_for_cart(2, 'BOFA')
procedure add_payment_for_cart(pi_cart_id number, pi_payment_details varchar)
as
v_total_payment number;
e_too_many_rows_being_inserted exception;
begin
    select sum(salesprice) into v_total_payment from cart_details where ctid = pi_cart_id group by ctid;
    insert into transactions values (tid_seq.nextval, v_total_payment, pi_payment_details, pi_cart_id);
    if sql%rowcount > 1 then
        raise e_too_many_rows_being_inserted;
        rollback;
    else 
        commit;
    end if;
    exception 
        when no_data_found then
            dbms_output.put_line('cannot find this cart');
        when e_too_many_rows_being_inserted then 
            dbms_output.put_line('only one payment for one cart');
        when others then
            dbms_output.put_line(SQLERRM);

end add_payment_for_cart;

end place_order;
/

----------------------------------------------------------------------TRIGGER----------------------------------
create or replace trigger updateInventoryOnLessStock
before update of quantity on inventory for each row
begin
    if :new.quantity <= 10 and :new.quantity > 0 then 
        dbms_output.put_line('Quantity less. Please call supplier soon');
    elsif :new.quantity = 0 then
        dbms_output.put_line('No more quantity left');
    end if;
    
    exception 
        when others then
            dbms_output.put_line(SQLERRM);
end;
/
--desc membership;
create or replace trigger customer_added_membership 
before insert or update of mid on customer for each row
declare 
v_membership_name varchar(25);
begin 
    if :old.mid is null then
        dbms_output.put_line('Congrats customer joined membership');
    else 
        select name into v_membership_name from membership where mid = :new.mid;
        dbms_output.put_line('Congrats customer updated membership to ' || v_membership_name);
    end if;

exception 
    when others then
        dbms_output.put_line(SQLERRM);
end;
/