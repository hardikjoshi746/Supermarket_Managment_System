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

