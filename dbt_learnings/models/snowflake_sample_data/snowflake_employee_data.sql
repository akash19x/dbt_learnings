with snowflake_employee_data as (
    select * from {{ source('snowflake_employee_data', 'employee') }}
),

final as (
    select * from snowflake_employee_data
)

select * from final