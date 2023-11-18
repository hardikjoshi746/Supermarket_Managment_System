
--1) customer membership 

CREATE VIEW new_customer_savings_view AS
SELECT
    c.name AS customer_name,
    TO_CHAR(cr.date_created, 'MM') AS month,
    ABS(SUM(cd.salesprice - i.costprice)) AS amount_saved
FROM
    customer c
    JOIN cart cr ON c.cid = cr.cid
    JOIN cart_details cd ON cr.ctid = cd.ctid
    JOIN inventory i ON cd.iid = i.iid
GROUP BY
    TO_CHAR(cr.date_created, 'MM'),
    c.name;

--2) sales summary 

CREATE VIEW inventory_sales_view AS
SELECT
    i.iid,
    i.name,
    COUNT(*) AS quantity_sold,
    SUM(cd.salesprice - i.purchaseprice) AS margin_per_item
FROM
    customer c
    JOIN cart cr ON c.cid = cr.cid
    JOIN cart_details cd ON cr.ctid = cd.ctid
    JOIN inventory i ON cd.iid = i.iid
GROUP BY
    i.iid, i.name
ORDER BY
    COUNT(*) DESC;

SELECT * FROM inventory_sales_view;

--select * from inventory;

-- 3) products that need to be replaced 
CREATE VIEW perishable_inventory_view AS
SELECT *
FROM inventory
WHERE (perishable = 'Y' AND (expiration_date - SYSDATE) < 10) OR (quantity = 0);

SELECT * FROM perishable_inventory_view;



-- 4) Customer transections


CREATE VIEW customer_transactions_view AS
SELECT
    c.cid AS customer_id,
    c.name AS customer_name,
    t.tid AS transaction_id,
    t.total_payment AS total_payment,
    t.payment_details AS payment_details,
    ct.date_created AS transaction_date
FROM
    CUSTOMER c
    JOIN CART ct ON c.cid = ct.cid
    JOIN TRANSACTIONS t ON ct.ctid = t.ctid;

SELECT * FROM customer_transactions_view;

-- 5) most product sold

CREATE VIEW most_sold_products_view AS
SELECT
    i.iid AS product_id,
    i.name AS product_name,
    COUNT(*) AS quantity_sold
FROM
    CART_DETAILS cd
    JOIN INVENTORY i ON cd.iid = i.iid
GROUP BY
    i.iid, i.name
ORDER BY
    COUNT(*) DESC;
    
SELECT * FROM most_sold_products_view;



