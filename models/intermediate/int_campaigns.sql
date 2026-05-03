
SELECT *
FROM {{ ref('stg_gz__adwords') }}
UNION ALL
SELECT *
FROM {{ ref('stg_gz__bing') }}
UNION ALL
SELECT *
FROM {{ ref('stg_gz__criteo') }}
UNION ALL
SELECT *
FROM {{ ref('stg_gz__facebook') }}
