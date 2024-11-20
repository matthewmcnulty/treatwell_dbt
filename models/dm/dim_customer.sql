{{ config(
    materialized='incremental',
    unique_key='customer_id'
) }}

WITH cte_customer AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        c.email,
        c.gender,
        c.ip_address,
        c.country,
        c.marketing_consent,
        c.phonenumber,
        c.size,
        c.created,
        c.updated
    FROM {{ ref('stg_customer') }} c
)

SELECT
    customer_id AS customer_id,
    first_name AS first_name,
    last_name AS last_name,
    email AS email,
    gender AS gender,
    ip_address AS ip_address,
    country AS country_code,
    marketing_consent AS marketing_consent,
    phonenumber AS phone_number,
    size AS clothing_size,
    created AS created_date,
    updated AS updated_date 
FROM cte_customer
