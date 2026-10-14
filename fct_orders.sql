SELECT
order_id,
customer_id,
order_date,
amount,
cost,
profit,
status
FROM {{ ref('int_order_profit') }}
WHERE status = 'delivered'
