with source as (
    select * from {{ source('raw', 'bing') }}
),

renamed as (
    select
      date_date,
      paid_source,
      campaign_key,
        REPLACE(camPGN_name,  'é' , 'e') AS campaign_name,
        CAST(ads_cost AS FLOAT64 ) AS ads_cost,
        CAST(impression AS INT64 ) AS impression,
        CAST(click AS INT64 ) AS click
    from source
)

select * from renamed