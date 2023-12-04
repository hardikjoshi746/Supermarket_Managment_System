show user;

select * from user_objects;
--create usersx
-- create customers TODO - required ?
create user c1 identified by welcome123#;
grant create session to c1;
grant unlimited tablespace to c1;

create user c2 identified by welcome123#;
grant create session to c2;
grant unlimited tablespace to c2;

-- create managers
create user sm1 identified by welcome123#;
grant create session to sm1;
grant unlimited tablespace to sm1;

create user sm2 identified by welcome123#;
grant create session to sm2;
grant unlimited tablespace to sm2;

-- create cashiers
create user cash1 identified by welcome123#;
grant create session to cash1;
grant unlimited tablespace to cash1;

create user cash2 identified by welcome123#;
grant create session to cash2;
grant unlimited tablespace to cash2;

-- create roles
create role Storemanager;
create role customer;
create role cashier;

-- grant privileges to roles
--TODO
--Storemanager---------------------------------------
--privileges on tables
grant select, insert, update, delete on jayanti_dev.customer to Storemanager;
grant select, insert, update, delete on jayanti_dev.employee to Storemanager;
--TODO grant STOREMANAGER select, insert, update, delete on all tables to Storemanager

-- TODO privileges on most views
grant select on jayanti_dev.view_name to Storemanager; --TODO correct to right view name

-- privileges on stored procedures
--TODO do for most stored procedures
grant execute on jayanti_dev.hire_employee to Storemanager;

--Cashier--------------------------------------------
--privileges on tables to Cashier
grant select, insert, update, delete on jayanti_dev.cart_details to cashier;
grant select, insert, update, delete on jayanti_dev.customer to cashier;
grant select, insert, update, delete on jayanti_dev.transactions to cashier;
grant select, insert, update, delete on jayanti_dev.cart to cashier;

--grant privileges on procedure
grant execute on jayanti_dev.place_order to cashier;

--Customer-------------------------------------------
--privileges on view
grant select on jayanti_dev.invoice_view to customer;
-- select * from invoice_view where cid = user;  


-- give roles to users
-- customer roles
grant customer to c2;
grant customer to c1;

-- Storemanger roles
grant Storemanager to sm1;
grant Storemanager to sm2;

-- cashier roles
grant cashier to cash1;
grant cashier to cash2;



