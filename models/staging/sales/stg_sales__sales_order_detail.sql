with

sales_order_detail as (
    select * from {{ source('sales', 'sales_order_detail') }}
),

final as (
    select
        salesorderid as sales_order_id, 
        salesorderdetailid as sales_order_detail_id, 
        -- carriertrackingnumber, 
        orderqty as order_quantity, 
        productid as product_id, 
        specialofferid as special_offer_id, 
        unitprice as unit_price, 
        unitpricediscount as unit_price_discount, 
        linetotal as line_total 
        -- rowguid, 
        -- modifieddate
    from sales_order_detail
)

select * from final
