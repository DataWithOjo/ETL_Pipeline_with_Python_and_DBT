with source as (
    select
        *
    from {{ source('finance', 'finance_2023') }}
),
renamed as (
    select
        year,
        value::bigint,
        units,
        variable_code
    from source
)

select * from renamed
