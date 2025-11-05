{{ config(
    materialized = 'table',
    schema = 'dw_insurance'
)}}

select
    d.date_day,
    e.employee_id,
    e.first_name,
    c.certification_name,
    c.certification_cost
from {{ ref('stg_employee_certifications') }} c
inner join {{ ref('oliver_dim_employee') }} e
    on c.employee_id = e.employee_id
inner join {{ ref('oliver_dim_date') }} d
    on e.hire_date = d.date_day
