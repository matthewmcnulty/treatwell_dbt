{{ config(
    materialized='table'
) }}

select * from {{ source('treatwell', 'bookings_mock_data') }}
