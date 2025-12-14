/*
 * Full Outter Join
 */

select 
    first_name,
    last_name,
    orders.status as order_status,
    order_date,
    payment_method,
    payments.status as payment_status,
    amount,
    payments.created as payments_created_at,
from raw.jaffle_shop.customers
    inner join raw.jaffle_shop.orders
    on customers.id = orders.user_id

    full outer join raw.stripe.payments
    on orders.id = payments.order_id

-- select *
-- from raw.stripe.payments

-- select *
-- from raw.jaffle_shop.orders