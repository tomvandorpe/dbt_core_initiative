with

sales_order_header as (
    select * from {{ source('sales', 'sales_order_header') }}
),

final as (
    select
        salesorderid as sales_order_id, 
        revisionnumber as revision_number, 
        orderdate as order_date, 
        duedate as due_date, 
        shipdate as ship_date, 
        -- [status], 
        onlineorderflag as online_order_flag, 
        -- salesordernumber, 
        -- purchaseordernumber, 
        -- accountnumber, 
        -- customerid, 
        -- salespersonid, 
        -- territoryid, 
        -- billtoaddressid, 
        -- shiptoaddressid, 
        shipmethodid as ship_method_id, 
        -- creditcardid, 
        -- creditcardapprovalcode, 
        currencyrateid as currency_rate_id, 
        subtotal as sub_total, 
        taxamt as tax_amount, 
        -- freight, 
        totaldue as total_due
        -- comment_, 
        -- rowguid,
        -- modifieddate
    from sales_order_header
)

select * from final
