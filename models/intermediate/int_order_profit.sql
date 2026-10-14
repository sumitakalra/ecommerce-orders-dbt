SELECT
order_id,
customer_id,
order_date,
amount,
cost,
amount - cost AS profit,
status
FROM {{ ref('stg_orders') }}
