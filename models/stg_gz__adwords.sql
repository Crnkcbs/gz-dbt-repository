with source as (
    select * from {{ source('raw', 'adwords') }}
),

renamed as (
    select
      date_date,
      paid_source,
      campaign_key,
      impression,
      click,
        
        REPLACE(camPGN_name,  'é' , 'e') AS campaign_name,
        CAST(ads_cost AS FLOAT64 ) AS ads_cost
    from source
)

select * from renamed