with source as (
    select * from {{ source('raw', 'ship') }}
),

renamed as (
    select
        orders_id,
        shipping_fee, 
        logCost as logistics_cost, 
        CAST(ship_cost AS FLOAT64) as shipping_cost 
    from source
)

select * from renamed