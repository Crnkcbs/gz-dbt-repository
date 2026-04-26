with sales_margin as (
    select * from {{ ref('int_sales_margin') }}
)

select
    orders_id,
    date_date,
    
    sum(quantity) as quantity,
    
    round(sum(revenue), 2) as revenue,
    
    round(sum(purchase_cost), 2) as purchase_cost,
    
    round(sum(margin), 2) as margin
from sales_margin
group by 
    orders_id, 
    date_date