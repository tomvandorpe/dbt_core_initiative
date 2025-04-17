with

reasons as (
    select * from {{ ref('stg_sales__sales_reason') }}
),

order_reasons as (
    select * from {{ ref('stg_sales__sales_order_header_sales_reason') }}
),

orders as (
    select * from {{ ref('stg_sales__sales_order_header') }}
),

order_details as (
    select * from {{ ref('stg_sales__sales_order_detail') }}
),

final as (
    select 
        od.sales_order_detail_id,
        od.product_id,
        od.order_quantity,
        od.unit_price,
        od.unit_price_discount,
        od.line_total,
        od.sales_order_id,
        o.order_date,
        o.online_order_flag,
        o.sub_total,
        o.tax_amount,
        o.total_due
    from order_details od
    left join orders o
        on o.sales_order_id = od.sales_order_id
)

select * from final

