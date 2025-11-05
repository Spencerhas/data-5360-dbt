{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

select
    employee_id, 
    first_name,
    last_name, 
    email,
    PARSE_JSON(certification_json):certification_name::varchar(256) as certification_name,
    PARSE_JSON(certification_json):certification_cost::number(38, 0) as certification_cost,
    PARSE_JSON(certification_json):certification_awarded_date::date as certification_awarded_date
from {{ source('oliver_landing', 'employee_certifications')}}