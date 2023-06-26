with snowflake_employee_data as (
    select * from {{ source('snowflake_employee_data', 'employee') }}
),

final as (
    select employee_id, employee_first_name, department_id, employee_Address 
    from snowflake_employee_data where employee_id in (1,2)
)

select * from final