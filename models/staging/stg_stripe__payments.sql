with 

source as (

    select * from {{ source('payments', 'payments') }}

),

renamed as (

    select
        id as stripe_id,
        order_id,
        payment_method,
        status payment_status,
        amount as order_amount,
        created as order_created,
        _batched_at

    from source

)