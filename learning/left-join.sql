/*
 * Left Join
 * Data is in one table but not in the other
 * table, we'll query customers table and
 * fetch the relevant orders for each customer
 * if available.
 */

 select 
    customers.id as customer_id,
    first_name, 
    last_name,
    user_id, 
    status as order_status,
    order_date
 from raw.jaffle_shop.customers
    left join raw.jaffle_shop.orders -- order of table matters here
    on customers.id = orders.user_id
where user_id is null

/* The above query returns all the customers who
 * have never placed an order with the shop, maybe 
 * we should spend some marketing effort to get their
 * attention
 */
