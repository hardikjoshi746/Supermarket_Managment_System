--execute procedures
select * from employee;
select * from customer;
execute hire_employee('cashier1', 'Cashier', 400, 2);

execute add_customer(pi_name=>'cust3', pi_email=>'cust3@gmail.com', pi_dob => null, pi_membership=>'10%off', pi_m_st_date=>sysdate);

execute update_customer_membership_status(1, '15%off', sysdate);

select * from inventory;
execute update_inventory('pizza', null, 100, 40, 'Y', sysdate+100, 40, 2);

--Not executable multiple times because of unique constraint
--execute insert_new_inventory(pi_name=> 'ramen', pi_description=>'microwavable noodles', pi_costprice=> 50, pi_quantity=> 15, pi_perishable=>'Y', pi_expiration_date=> to_date('05-12-24', 'dd-mm-yy'), pi_purchase_price=>10 , pi_sid=> 3);

--for every new cart create a new anon block to save cart_id 
set serveroutput on;
declare 
v_cart_id number;
begin
v_cart_id := place_order.create_cart(1, sysdate-100, 5);
place_order.add_item_to_cart(v_cart_id, 'veggies', 2);
place_order.add_item_to_cart(v_cart_id, 'milk', 4);
place_order.add_payment_for_cart(v_cart_id, 'BofA');
end;
/

select * from inventory;
select * from cart_details;
select * from cart;
