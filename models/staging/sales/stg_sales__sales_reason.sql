with

sales_reason as (
    select * from {{ source('sales', 'sales_reason') }}
),

final as (
    select
        salesreasonid as sales_reason_id,
        sales_reason as sales_reason,
        reasontype as reason_type,
        concat(sales_reason, ' ', reasontype) as full_reason,
        modifieddate as modified_date
    from sales_reason
)

select * from final
