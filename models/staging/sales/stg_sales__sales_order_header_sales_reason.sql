with

sales_order_header_sales_reason as (
    select * from {{ source('sales', 'sales_order_header_sales_reason') }}
),

final as (
    select
        salesorderid as sales_order_id,
        salesreasonid as sales_reason_id,
        modifieddate as modified_date
    from sales_order_header_sales_reason
)

select * from final
