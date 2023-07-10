{{
    config(
        materialized='view'
    )
}}
with snowflake_employee_data as (
    select * from {{ source('snowflake_employee_data', 'employee') }}
),

final as (
    select * 
    from snowflake_employee_data)

select * from final

{% if is_incremental() %}

  where date_column >= (select max(date_column) from {{ this }})

{% endif %}

