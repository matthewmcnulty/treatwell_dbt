{{ config(
    materialized='incremental',
    unique_key='salon_id'
) }}

WITH salon_data AS (
    SELECT
        salon_id,
        salon_name,
        status,
        channel,
        description,
        location_id,
        url,
        venuetypeid,
        venuesubtypeids,
        phone,
        email,
        customerserviceemail,
        employeeselectionallowed,
        maxavailabilityperioddays,
        country,
        created_date,
        updated
    FROM {{ ref('stg_salon') }}
)

SELECT
    s.salon_id AS salon_id,
    s.salon_name AS salon_name,
    s.status AS salon_status,
    s.channel AS salon_channel,
    s.description AS description,
    s.url AS url,
    s.venuetypeid AS venue_type_id,
    s.venuesubtypeids AS venue_sub_type_ids,
    s.phone AS phone_number,
    s.email AS email,
    s.customerserviceemail AS customer_service_email,
    s.employeeselectionallowed AS employee_selection_allowed,
    s.maxavailabilityperioddays AS max_availability_period_days,
    s.country AS country_code,
    s.created_date AS created_date,
    s.updated AS updated_date
FROM salon_data s
