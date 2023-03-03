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
        {{-cents_to_dollars('amount')}} as amount, 
        created as created_at
    from source
    {{ limit_data_in_dev(column_name='created_at', days_of_data=3000)}}
)

select * from payments