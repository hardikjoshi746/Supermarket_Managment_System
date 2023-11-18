show user;
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

create user employee;
create user store_manager;
create user customer;

GRANT SELECT ON customer_transactions_view TO customer;
GRANT SELECT ON most_sold_products_view TO store_manager;
GRANT SELECT ON perishable_inventory_view TO store_manager, employee;
GRANT SELECT ON inventory_sales_view TO store_manager;
GRANT SELECT ON new_customer_savings_view TO customer, store_manager;




