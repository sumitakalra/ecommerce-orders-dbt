
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
    {{ calculate_profit('amount', 'cost') }} AS profit,
    status,
    updated_at

FROM {{ ref('stg_orders') }}

{% if var('apply_minimum_amount_filter', true) %}
WHERE amount >= {{ var('minimum_order_amount', 1000) }}
{% endif %}

{% if is_incremental() %}
{% if var('apply_minimum_amount_filter', true) %}
AND
{% else %}
WHERE
{% endif %}
updated_at > (
    SELECT COALESCE(
        MAX(updated_at),
        TIMESTAMP '1900-01-01 00:00:00'
    )
    FROM {{ this }}
)
{% endif %}
