show user;
SELECT * FROM global_name;


show grants;
show privileges;
select * from user_objects;

create user jayanti_dev identified by pswrdForJayanti2023#;
grant connect, resource to jayanti_dev;
grant create view to jayanti_dev;

create user hardik_dev identified by pswrdForhardik2110#;
grant connect, resource to hardik_dev;

GRANT UNLIMITED TABLESPACE TO hardik_dev;

GRANT UNLIMITED TABLESPACE TO jayanti_dev;

create user employee1 identified by pswrdForMan2023#;
CREATE USER store_manager IDENTIFIED BY pswrdForMan2023#;
CREATE USER customer IDENTIFIED BY pswrdForMan2023#;
grant connect, resource to employee1;
grant connect, resource to store_manager;
grant connect, resource to customer;

GRANT SELECT ON customer_transactions_view TO employee1;
GRANT SELECT ON most_sold_products_view TO store_manager;
GRANT SELECT ON perishable_inventory_view TO store_manager, employee1;
GRANT SELECT ON inventory_sales_view TO store_manager;
