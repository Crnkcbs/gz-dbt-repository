with orders_margin as (
    select * from {{ ref('int_orders_margin') }}
),

shipping as (
    select * from {{ ref('stg_gz__ship') }}
)

select
    o.orders_id,
    o.date_date,
    o.revenue,
    o.quantity,
    o.purchase_cost,
    o.margin,
    s.shipping_fee,
    s.logistics_cost,
    s.shipping_cost,
    round(o.margin + s.shipping_fee - s.logistics_cost - s.shipping_cost, 2) as operational_margin
from orders_margin o
left join shipping s 
    on o.orders_id = s.orders_id