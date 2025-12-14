with orders as (
    select * from {{ ref('stg_jaffle_shop__orders') }}
),

payments as (
    select * from {{ ref('stg_stripe__payments') }}
),

-- customers as (
--     select
--         customer_id,
--         order_id,
--     from {{ ref('stg_jaffle_shop__customers') }}
-- )

final as (
    select
        payments.order_id,
        orders.order_status,

        sum(payments.order_amount) as total_order_amount,
        
        sum ( 
            case 
                when order_status in ('returned', 'return_pending') then 0
                when payment_status = 'failed' then 0
                else payments.order_amount
            end 
        ) as net_order_amount

    from payments

    left join orders using (order_id)

    group by 1, 2

    order by 1
)

select * from final