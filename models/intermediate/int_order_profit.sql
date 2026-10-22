{{
    config(
        materialized='incremental',
        unique_key='order_id',
        incremental_strategy='delete+insert'
    )
}}

SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    cost,
    amount - cost AS profit,
    status,
    updated_at
FROM {{ ref('stg_orders') }}

{% if is_incremental() %}
WHERE updated_at > (
    SELECT COALESCE(MAX(updated_at), TIMESTAMP '1900-01-01 00:00:00')
    FROM {{ this }}
)
{% endif %}
