with orders as (
    Select * from {{ref('stg_jaffle_shop__orders')}}
),
payments as (
    Select * from {{ref('stg_stripe__payment')}}
                ) ,
order_payments as (
    select
        orders.order_id,
        sum (case when orders.status = 'success' then payments.amount else 0 end) as amount,
        orders.customer_id,
        orders.order_date
    from orders
    left join payments using (order_id)
    group by all
)

Select * from order_payments;
