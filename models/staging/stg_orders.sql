SELECT
CAST(order_id AS INTEGER) AS order_id,
CAST(customer_id AS INTEGER) AS customer_id,
CAST(order_date AS DATE) AS order_date,
CAST(amount AS DECIMAL(10, 2)) AS amount,
CAST(cost AS DECIMAL(10, 2)) AS cost,
LOWER(TRIM(status)) AS status
FROM {{ ref('raw_orders') }}
WHERE order_id IS NOT NULL
