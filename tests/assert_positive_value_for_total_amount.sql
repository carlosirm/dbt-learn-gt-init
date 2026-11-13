Select
order_id,
sum(amount) as total_amount
from {{ref('stg_stripe__payment')}}
group by all
having total_amount < 0