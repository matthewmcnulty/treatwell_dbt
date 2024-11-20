{{ config(
    materialized='incremental',
    unique_key='service_id'
) }}

WITH services_data AS (
    SELECT
        service_id,
        salon_id,
        name,
        description,
        treatment_type,
        leadtimeminutes,
        multioptionselectionallowed,
        package,
        minimumclientage,
        currency_code,
        service_price,
        discount_percentage,
        updated
    FROM {{ ref('stg_services') }}
)

SELECT
    s.service_id AS service_id,
    s.salon_id AS salon_id,
    s.name AS service_name,
    s.description AS description,
    s.treatment_type AS treatment_type,
    s.leadtimeminutes AS lead_time_minutes,
    s.multioptionselectionallowed AS multi_option_selection_allowed,
    s.package AS package_only,
    s.minimumclientage AS minimum_client_age,
    s.currency_code AS currency_code,
    s.service_price AS service_price,
    s.discount_percentage AS discount_percentage,
    -- IS_CURRENT,
    s.updated AS updated_date
FROM services_data s
