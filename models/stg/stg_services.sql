{{ config(
    materialized='table'
) }}

select * from {{ source('treatwell', 'services_mock_data') }}
