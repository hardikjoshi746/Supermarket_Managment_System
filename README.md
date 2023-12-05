# DMDD-Supermarket Management System
The database is designed to facilitate seamless business operations for supermarket, incorporating tables such as Customer, Employee, Inventory, and Transaction. The system ensures accurate inventory management, facilitates order fulfillment through collaboration with warehouses, and assigns shipping details for efficient delivery. With well-organized tables and interlinked data, the database optimally supports sales representatives, warehouse managers, and customers in a streamlined and effective business process.
## Members
```
Hardik Joshi       2767912
Jayanti            2821163

```
### Workflow 
- Users for different roles (c1, c2, sm1, sm2, cash1, cash2) are created with the necessary privileges. 
- Stored procedures are created for actions like hiring employees, adding customers, updating customer membership status, and updating inventory. Procedures include error handling for various scenarios.
- Several views are created to provide insights into customer savings, inventory sales, products to be replaced, customer transactions, and most sold products.
- Triggers are implemented for inventory quantity updates and customer membership validation during insert and update operations. The triggers provide warnings for low stock and enforce membership-related constraints
- Views are created to analyze sales data, such as total sales per season, per month sales per employee, and a hierarchical query (chain_of_commands) to show the chain of command in the organization. 
-  Generated reports using views like customer invoices, sales per season, and per month sales per employee to gain insights into the business.


### Code execution
1. `Create_Database_Object_Script`
    * Existing objects,tables,constraints are replaced.
    * Tables are created and data is inserted.
    * Constraints are applied to tables.
    * Creates view object in database
    * Creates 4 roles :
        - `Admin`
        - `Storemanager`
        - `cashier` 
        - `cashier`

2. `supermarket_procedures_3`
    * Creates 5 Procedures 
        - `hire_employee`
        - `add_customer`
        - `update_customer_membership_status` 
        - `update_inventory`
        - `add_payment_for_cart`
    * Creates function 
        - `create_cart`
    * Creates Triggers 
        - `updateInventoryOnLessStock`
        - `customer_added_membership`
      
3. `dev_supermarket_views`
    * Creates 9 views to generate detailed insights for recorded data.
        - `new_customer_savings_view`
        - `inventory_sales_view`
        - `replace_inventory_view` 
        - `Invoice_viecustomer_transactions_view`
        - `customer_transactions_view`
        - `invoice_view`
        - `per_month_sales_per_employee`
        - `total_sales_per_season`
        - `chain_of_commands`
