SELECT
    {{ dbt_utils.generate_surrogate_key(['order_id', 'customer_id']) }} AS order_customer_key,
    order_id,
    customer_id,
    order_date,
    amount,
    cost,
    profit,
    status
FROM {{ ref('int_order_profit') }}
WHERE status = 'delivered'
