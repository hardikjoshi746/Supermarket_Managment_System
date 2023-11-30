show user;

select * from user_objects;
--create users
-- create customers
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


-- give roles to users
-- grant customer roles
grant customer to c1;
grant customer to c2;

-- grant Storemanger roles
grant Storemanager to sm1;
grant Storemanager to sm2;

--grant cashier roles
grant cashier to cash1;
grant cashier to cash2;



