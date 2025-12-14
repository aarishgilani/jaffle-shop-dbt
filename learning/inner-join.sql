/*
 * Inner Joins
 *
 * Joins orders and customers table using user_id
 * and groups similar orders together noting the count
 * of purchases made in the last count column.
 * 
 * The query performs a inner join that would mean
 * any customer who has not bought anything yet will
 * be excluded from the results.
 */
select customers.id, first_name, last_name, count(customers.id)
from raw.jaffle_shop.customers
    inner join raw.jaffle_shop.orders
    on customers.id = orders.user_id
group by 1, 2, 3
order by customers.id


