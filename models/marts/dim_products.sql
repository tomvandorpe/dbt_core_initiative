with

sales_information as (
    select * from {{ ref('int_order_details_with_full_reason') }}
),

final as (
    select
        product_id,
        sum(order_quantity) as quantity_ordered,
        min(unit_price) as min_unit_price,
        max(unit_price) as max_unit_price,
        min(unit_price_discount) as min_unit_discount,
        max(unit_price_discount) as max_unit_discount
    from sales_information
    group by product_id
)

select * from final