{{ config(
    materialized='table'
) }}

select * from {{ source('treatwell', 'customer_mock_data') }}
