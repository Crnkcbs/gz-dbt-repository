SELECT
    f.date_date,
    -- Finans ekibinin istediği ana kar göstergesi
    ROUND(CAST(f.operational_margin AS FLOAT64) - CAST(c.ads_cost AS FLOAT64), 2) AS ads_margin,
    f.average_basket,
    f.operational_margin,
    c.ads_cost,
    c.ads_impression,
    c.ads_clicks,
    f.quantity,
    f.revenue,
    f.purchase_cost,
    -- Margin: finance_days içinde margin diye bir sütun yoksa revenue - purchase_cost olarak hesaplıyoruz
    ROUND(f.revenue - f.purchase_cost, 2) AS margin,
    f.shipping_fee,
    f.log_cost, -- Toplam lojistik maliyeti (logistics + shipping)
    f.ship_cost  -- Sadece kargo maliyeti
FROM {{ ref('finance_days') }} AS f
LEFT JOIN {{ ref('int_campaigns_day') }} AS c 
    ON f.date_date = c.date_date
ORDER BY f.date_date DESC