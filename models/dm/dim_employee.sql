{{ config(
    materialized='incremental',
    unique_key='employee_id'
) }}

WITH employee_data AS (
    SELECT
        employee_id,
        salon_id,
        name,
        jobtitle,
        providedservices,
        notes,
        active,
        image_id,
        updated
    FROM {{ ref('stg_employee') }}
)

SELECT
    e.employee_id AS employee_id,
    e.salon_id AS salon_id,
    e.name AS employee_name,
    e.jobtitle AS job_title,
    e.providedservices AS provided_services,
    e.notes AS notes,
    e.active AS active,
    e.image_id AS employee_image_id,
    -- IS_CURRENT,
    e.updated AS updated_date
FROM employee_data e
