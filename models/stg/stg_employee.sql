{{ config(
    materialized='table'
) }}

select * from {{ source('treatwell', 'employee_mock_data') }}