set serveroutput on;

select * from employee;
execute hire_employee('cashier1', 'Cashier', 400, 2);
execute hire_employee('cashier2', 'Cashier', 400, 2);
execute hire_employee('cashier3', 'Cashier', 400, 2);
execute hire_employee('cashier4', 'Cashier', 400, 2);
execute hire_employee('cashier5', 'Cashier', 400, 2);
execute hire_employee('Stocker1', 'Stocker', 400, 3);
execute hire_employee('Stocker2', 'Stocker', 400, 3);
execute hire_employee('Stocker3', 'Stocker', 400, 3);
execute hire_employee('Stocker4', 'Stocker', 400, 3);
execute hire_employee('Stocker5', 'Stocker', 400, 3);
select * from cart;
select * from cart_details where ctid = 2;
execute add_customer(pi_name=>'cust1', pi_email=>'cust1@gmail.com', pi_dob => null, pi_membership=>'10%off', pi_m_st_date=>sysdate);
execute add_customer(pi_name=>'cust2', pi_email=>'cust2@gmail.com', pi_dob => null, pi_membership=>'15%off', pi_m_st_date=>sysdate);
execute add_customer(pi_name=>'cust3', pi_email=>'cust3@gmail.com', pi_dob => null, pi_membership=>'10%off', pi_m_st_date=>sysdate);
execute add_customer(pi_name=>'cust4', pi_email=>'cust4@gmail.com', pi_dob => null, pi_membership=>'20%off', pi_m_st_date=>sysdate);
execute add_customer(pi_name=>'cust5', pi_email=>'cust5@gmail.com', pi_dob => null, pi_membership=>'15%off', pi_m_st_date=>sysdate);
execute add_customer(pi_name=>'cust6', pi_email=>'cust6@gmail.com', pi_dob => null, pi_membership=>'20%off', pi_m_st_date=>sysdate);
execute add_customer(pi_name=>'cust7', pi_email=>'cust7@gmail.com', pi_dob => null, pi_membership=>'20%off', pi_m_st_date=>sysdate);
execute add_customer(pi_name=>'cust8', pi_email=>'cust8@gmail.com', pi_dob => null, pi_membership=>'10%off', pi_m_st_date=>sysdate);
execute add_customer(pi_name=>'cust9', pi_email=>'cust9@gmail.com', pi_dob => null, pi_membership=>'15%off', pi_m_st_date=>sysdate);
execute add_customer(pi_name=>'cust10', pi_email=>'cust10@gmail.com', pi_dob => null, pi_membership=>'10%off', pi_m_st_date=>sysdate);
execute add_customer(pi_name=>'cust10', pi_email=>'cust10@gmail.com', pi_dob => null, pi_membership=>null, pi_m_st_date=>sysdate);

select * from customer;

execute update_customer_membership_status(1, '15%off', sysdate);
execute update_customer_membership_status(2, '15%off', sysdate);
execute update_customer_membership_status(3, '10%off', sysdate);
execute update_customer_membership_status(4, '20%off', sysdate);

execute update_inventory('pizza', null, 100, 40, 'Y', sysdate+100, 40, 2);
EXECUTE update_inventory('milk', null, 100, 30, 'Y', sysdate + 8, 20, 2);
EXECUTE update_inventory('veggies', null, 100, 40, 'Y', sysdate + 20, 25, 3);
EXECUTE update_inventory('fruits', null, 100, 85, 'Y', sysdate + 100, 70, 2);
EXECUTE update_inventory('chocolate', null, 100, 50, 'Y', sysdate + 60, 30, 1);
EXECUTE update_inventory('toothpaste', null, 100, 40, 'Y', sysdate + 240, 90, 2);
EXECUTE update_inventory('shampoo', null, 100, 40, 'Y', sysdate + 180, 5, 1);
select * from inventory;
--Not executable multiple times because of unique constraint
--execute insert_new_inventory(pi_name=> 'ramen', pi_description=>'microwavable noodles', pi_costprice=> 50, pi_quantity=> 15, pi_perishable=>'Y', pi_expiration_date=> to_date('05-12-24', 'dd-mm-yy'), pi_purchase_price=>10 , pi_sid=> 3);

--for every new cart create a new anon block to save cart_id 
declare 
v_cart_id number;
begin
v_cart_id := place_order.create_cart(1, sysdate-100, 6);
place_order.add_item_to_cart(v_cart_id, 'veggies', 1);
place_order.add_item_to_cart(v_cart_id, 'milk', 2);
place_order.add_payment_for_cart(v_cart_id, 'BofA');
end;
/

declare 
v_cart_id number;
begin
v_cart_id := place_order.create_cart(2, sysdate-50, 8);
place_order.add_item_to_cart(v_cart_id, 'cocacola', 1);
place_order.add_item_to_cart(v_cart_id, 'pizza', 2);
place_order.add_item_to_cart(v_cart_id, 'chocolate', 1);
place_order.add_item_to_cart(v_cart_id, 'toothpaste', 3);
place_order.add_item_to_cart(v_cart_id, 'fruits', 2);
place_order.add_payment_for_cart(v_cart_id, 'BofA');
end;
/

declare 
v_cart_id number;
begin
v_cart_id := place_order.create_cart(8, sysdate-200, 5);
place_order.add_item_to_cart(v_cart_id, 'pizza', 2);
place_order.add_payment_for_cart(v_cart_id, 'BofA');
end;
/

declare 
v_cart_id number;
begin
v_cart_id := place_order.create_cart(3, sysdate-35, 8);
place_order.add_item_to_cart(v_cart_id, 'milk', 3);
place_order.add_item_to_cart(v_cart_id, 'veggies', 2);
place_order.add_item_to_cart(v_cart_id, 'shampoo', 1);
place_order.add_payment_for_cart(v_cart_id, 'BofA');
end;
/
--------------------------

declare 
v_cart_id number;
begin
v_cart_id := place_order.create_cart(9, sysdate-65, 7);
place_order.add_item_to_cart(v_cart_id, 'pastry', 1);
place_order.add_item_to_cart(v_cart_id, 'veggies', 1);
place_order.add_item_to_cart(v_cart_id, 'cocacola', 1);
place_order.add_payment_for_cart(v_cart_id, 'BofA');
end;
/

declare 
v_cart_id number;
begin
v_cart_id := place_order.create_cart(7, sysdate-105, 6);
place_order.add_item_to_cart(v_cart_id, 'pizza', 1);
place_order.add_item_to_cart(v_cart_id, 'cake', 1);
place_order.add_item_to_cart(v_cart_id, 'shampoo', 2);
place_order.add_payment_for_cart(v_cart_id, 'BofA');
end;
/

declare 
v_cart_id number;
begin
v_cart_id := place_order.create_cart(6, sysdate-35, 6);
place_order.add_item_to_cart(v_cart_id, 'milk', 4);
place_order.add_item_to_cart(v_cart_id, 'veggies', 2);
place_order.add_item_to_cart(v_cart_id, 'shampoo', 4);
place_order.add_payment_for_cart(v_cart_id, 'BofA');
end;
/

declare 
v_cart_id number;
begin
v_cart_id := place_order.create_cart(4, sysdate-35, 4);
place_order.add_item_to_cart(v_cart_id, 'milk', 4);
place_order.add_item_to_cart(v_cart_id, 'veggies', 2);
place_order.add_item_to_cart(v_cart_id, 'shampoo', 4);
place_order.add_payment_for_cart(v_cart_id, 'BofA');
end;
/

