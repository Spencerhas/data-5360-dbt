 {{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}


SELECT
c.first_name as customer_first_name,
c.last_name as customer_last_name,
d.date_day,
s.store_name,
e.first_name as employee_first_name,
e.last_name as employee_last_name,
o.total_amount

FROM {{ ref('fact_sales') }} o

LEFT JOIN {{ ref('oliver_dim_customer') }} c
    ON o.customer_key = c.customer_key

LEFT JOIN {{ ref('oliver_dim_date') }} d
    ON o.date_key = d.date_key

LEFT JOIN {{ ref('oliver_dim_store') }} s
    ON o.store_key = s.store_key

LEFT JOIN {{ ref('oliver_dim_employee') }} e
    ON o.employee_key = e.employee_key
