{{ config(
    materialized='table'
) }}

select * from {{ source('treatwell', 'salon_mock_data') }}