with sales as (
    select * from {{ ref('stg_gz__sales') }}
),

products as (
    select * from {{ ref('stg_gz__product') }}
)

select
    s.orders_id,
    s.date_date,
    s.pdt_id,
    s.revenue,
    s.quantity,
    p.purchase_price,
    -- Satın alma maliyeti: miktar * birim satın alma fiyatı
    round(s.quantity * p.purchase_price, 2) as purchase_cost,
    -- Marj: gelir - satın alma maliyeti
    round(s.revenue - (s.quantity * p.purchase_price), 2) as margin
from sales s
left join products p 
    on s.pdt_id = p.products_id