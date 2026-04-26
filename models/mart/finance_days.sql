with orders as (
    select * from {{ ref('int_orders_operational') }}
)

select
    date_date,
    -- Toplam işlem sayısı 
    count(orders_id) as nb_transactions,
    -- Toplam gelir
    round(sum(revenue), 2) as revenue,
    -- Ortalama Sepet (Toplam Gelir / Toplam İşlem Sayısı)
    round(safe_divide(sum(revenue), count(orders_id)), 2) as average_basket,
    -- Toplam Operasyonel Marj
    round(sum(operational_margin), 2) as operational_margin,
    -- Toplam satın alma maliyeti
    round(sum(purchase_cost), 2) as purchase_cost,
    -- Toplam nakliye ücretleri (Müşteriden alınan)
    round(sum(shipping_fee), 2) as shipping_fee,
    -- Toplam lojistik maliyetleri (Firmadan çıkan: logcost + ship_cost)
    round(sum(logistics_cost + shipping_cost), 2) as log_cost,
    -- Satılan toplam ürün miktarı
    sum(quantity) as quantity
from orders
group by 
    date_date
order by 
    date_date desc