{{ config(
    materialized='table',
    unique_key='date_key'
) }}

WITH date_range AS (
    SELECT generate_series(
        '2015-01-01'::date,   -- Start date
        '2035-12-31'::date,   -- End date
        '1 day'::interval      -- Step interval
    )::date AS date
)

SELECT
    TO_CHAR(d.date, 'YYYYMMDD')::INT AS date_key,       -- Date in YYYYMMDD format
    d.date AS date,                                -- Full date
    EXTRACT(DOW FROM d.date) AS day_of_week,       -- Day of the week (0 = Sunday, 6 = Saturday)
    EXTRACT(WEEK FROM d.date) AS week,       -- Day of the week (0 = Sunday, 6 = Saturday)
    EXTRACT(MONTH FROM d.date) AS month,           -- Month (1 to 12)
    EXTRACT(QUARTER FROM d.date) AS quarter,       -- Quarter (1 to 4)
    EXTRACT(YEAR FROM d.date) AS year,             -- Year
    CASE WHEN EXTRACT(DOW FROM d.date) IN (0, 6) THEN TRUE ELSE FALSE END AS is_weekend  -- Check if it's weekend (0=Sunday, 6=Saturday)
FROM date_range d
ORDER BY d.date
