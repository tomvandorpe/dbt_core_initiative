with

full_detail as (
    select * from {{ ref('int_order_details_with_full_reason') }}
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key(["sales_order_detail_id"]) }} as sk_sale,
        *
    from full_detail
)

select * from final