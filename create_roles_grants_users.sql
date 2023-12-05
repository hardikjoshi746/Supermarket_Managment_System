show user;

select * from user_objects;
--create user jayanti_dev identified by pswrdForJayanti2023#;
--grant connect, resource to jayanti_dev;


--create user hardik_dev identified by pswrdForhardik2110#;
--grant connect, resource to hardik_dev;
--create usersx
-- create customers TODO - required ?

create user c1 identified by pswrdForMan2023#;
grant create session to c1;
grant unlimited tablespace to c1;

create user c2 identified by pswrdForMan2023#;
grant create session to c2;
grant unlimited tablespace to c2;

-- create managers
create user sm1 identified by pswrdForMan2023#;
grant create session to sm1;
grant unlimited tablespace to sm1;

create user sm2 identified by pswrdForMan2023#;
grant create session to sm2;
grant unlimited tablespace to sm2;

-- create cashiers
create user cash1 identified by pswrdForMan2023#;
grant create session to cash1;
grant unlimited tablespace to cash1;

create user cash2 identified by pswrdForMan2023#;
grant create session to cash2;
grant unlimited tablespace to cash2;

-- create roles
create role Storemanager;
create role customer_role;
create role cashier;

-- grant privileges to roles
--TODO
--Storemanager---------------------------------------
--privileges on tables
grant select, insert, update, delete on jayanti_dev.customer to Storemanager;
grant select, insert, update, delete on jayanti_dev.employee to Storemanager;
grant select, insert, update, delete on jayanti_dev.membership to Storemanager;
grant select, insert, update, delete on jayanti_dev.CART to Storemanager;
grant select, insert, update, delete on jayanti_dev.TRANSACTIONS to Storemanager;
grant select, insert, update, delete on jayanti_dev.SUPPLIER to Storemanager;
grant select, insert, update, delete on jayanti_dev.INVENTORY to Storemanager;
grant select, insert, update, delete on jayanti_dev.CART_DETAILS to Storemanager;
--TODO grant STOREMANAGER select, insert, update, delete on all tables to Storemanager

-- TODO privileges on most views
grant select on jayanti_dev.new_customer_savings_view to Storemanager;
grant select on jayanti_dev.inventory_sales_view to Storemanager;
grant select on jayanti_dev.replace_inventory_view to Storemanager;
grant select on jayanti_dev.customer_transactions_view to Storemanager;
grant select on jayanti_dev.most_sold_products_view to Storemanager;

grant select on jayanti_dev.new_customer_savings_view to Cashier;
grant select on jayanti_dev.replace_inventory_view to Cashier;
grant select on jayanti_dev.customer_transactions_view to Cashier;


-- privileges on stored procedures
--TODO do for most stored procedures
grant execute on jayanti_dev.hire_employee to Storemanager;
grant execute on jayanti_dev.add_customer to Storemanager;
grant execute on jayanti_dev.update_customer_membership_status to Storemanager;
grant execute on jayanti_dev.update_inventory to Storemanager;
grant execute on jayanti_dev.place_order to Storemanager;

--Cashier--------------------------------------------
--privileges on tables to Cashier
grant select, insert, update, delete on jayanti_dev.customer to cashier;
grant select, insert, update, delete on jayanti_dev.employee to cashier;
grant select, insert, update, delete on jayanti_dev.membership to cashier;
grant select, insert, update, delete on jayanti_dev.CART to cashier;
grant select, insert, update, delete on jayanti_dev.TRANSACTIONS to cashier;
grant select, insert, update, delete on jayanti_dev.SUPPLIER to cashier;
grant select, insert, update, delete on jayanti_dev.INVENTORY to cashier;
grant select, insert, update, delete on jayanti_dev.CART_DETAILS to cashier;

--grant privileges on procedure
grant execute on jayanti_dev.place_order to cashier;
grant execute on jayanti_dev.add_customer to cashier;
grant execute on jayanti_dev.update_customer_membership_status to cashier;
grant execute on jayanti_dev.update_inventory to cashier;
show user;
--Customer-------------------------------------------
--privileges on view
grant select on jayanti_dev.invoice_view to customer_role;
-- select * from invoice_view where cid = user;  


-- give roles to users
-- customer roles
grant customer_role to c2;
grant customer_role to c1;

-- Storemanger roles
grant Storemanager to sm1;
grant Storemanager to sm2;

-- cashier roles
grant cashier to cash1;
grant cashier to cash2;



