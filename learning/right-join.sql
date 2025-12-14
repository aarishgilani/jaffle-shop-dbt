/*
 * Right Join
 * 
 */

 select first_name, 
        last_name,
        customers.id as customer_id
 from raw.jaffle_shop.orders
    right join raw.jaffle_shop.customers
    on customers.id = orders.user_id
where orders.user_id is null