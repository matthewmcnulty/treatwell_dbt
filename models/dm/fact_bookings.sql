{{ config(
    materialized='incremental',
    unique_key=['booking_id', 'service_id']
) }}

WITH service_data AS (
    SELECT
        booking_id,
        jsonb_array_elements(service_ids::jsonb) AS service_element
    FROM {{ ref('stg_bookings') }}
),

cte_bookings AS (
    SELECT
        b.booking_id,
        b.customer_id,
        b.employee_id,
        sd.service_element->>'service' as service_id,
        b.service_ids,
        b.salon_id,
        b.country_code,
        (b.booking_policy::jsonb)->>'rescheduleCutOff' AS reschedule_cutoff,
        (b.booking_policy::jsonb)->>'cancellationCutOff' AS cancellation_cutoff,
        (b.fulfilment_info::jsonb)->>'bookingDate' AS booking_date,
        (b.fulfilment_info::jsonb)->>'startTime' AS start_time,
        (b.fulfilment_info::jsonb)->>'treatmentDurationMinutes' AS treatment_duration_minutes,
        (b.fulfilment_info::jsonb)->>'venueTimezone' AS venue_timezone,
        b.price,
        b.currency_code,
        b.status,
        b.created::date,
        b.updated::date
    FROM {{ ref('stg_bookings') }} b
    LEFT JOIN service_data sd
        ON b.booking_id = sd.booking_id
)

SELECT
    booking_id::INT AS booking_id,
    customer_id::INT AS customer_id,
    employee_id::INT AS employee_id,
    service_id::INT AS service_id,
    salon_id::INT AS salon_id,
    -- COUNTRY_KEY,
    country_code AS country_code,
    reschedule_cutoff AS reschedule_cutoff,
    cancellation_cutoff AS cancellation_cutoff,
    -- BOOKED_DATE_KEY,
    booking_date AS booking_date,
    start_time AS start_time,
    treatment_duration_minutes AS treatment_duration_minutes,
    venue_timezone AS venue_timezone,
    price AS booked_price,
    currency_code AS currency_code,
    status AS booking_status,
    TO_CHAR((created), 'YYYYMMDD')::INT AS created_date_key,
    created AS created_date,
    updated AS updated_date
FROM cte_bookings
