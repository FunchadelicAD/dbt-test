with source as (
    select * 
    from {{ source('stripe', 'payment')}}
),


payments as (
    select 
        id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        amount/100 as amount, 
        created as created_at
    from source
)

select * from payments