{{ config(
    materialized='table',
    unique_key='country_key'
) }}

WITH country_data AS (
    SELECT
        1 AS country_key, 'AT' AS country_code, 'Austria' AS country_name, 'EUR' AS currency_code, 'Euro' AS currency_name
    UNION ALL
    SELECT
        2, 'BE', 'Belgium', 'EUR', 'Euro'
    UNION ALL
    SELECT
        3, 'BG', 'Bulgaria', 'BGN', 'Bulgarian Lev'
    UNION ALL
    SELECT
        4, 'HR', 'Croatia', 'HRK', 'Croatian Kuna'
    UNION ALL
    SELECT
        5, 'CY', 'Cyprus', 'EUR', 'Euro'
    UNION ALL
    SELECT
        6, 'CZ', 'Czech Republic', 'CZK', 'Czech Koruna'
    UNION ALL
    SELECT
        7, 'DK', 'Denmark', 'DKK', 'Danish Krone'
    UNION ALL
    SELECT
        8, 'EE', 'Estonia', 'EEK', 'Estonian Kroon'
    UNION ALL
    SELECT
        9, 'FI', 'Finland', 'EUR', 'Euro'
    UNION ALL
    SELECT
        10, 'FR', 'France', 'EUR', 'Euro'
    UNION ALL
    SELECT
        11, 'DE', 'Germany', 'EUR', 'Euro'
    UNION ALL
    SELECT
        12, 'GR', 'Greece', 'EUR', 'Euro'
    UNION ALL
    SELECT
        13, 'HU', 'Hungary', 'HUF', 'Hungarian Forint'
    UNION ALL
    SELECT
        14, 'IS', 'Iceland', 'ISK', 'Icelandic Króna'
    UNION ALL
    SELECT
        15, 'IE', 'Ireland', 'EUR', 'Euro'
    UNION ALL
    SELECT
        16, 'IT', 'Italy', 'EUR', 'Euro'
    UNION ALL
    SELECT
        17, 'LV', 'Latvia', 'EUR', 'Euro'
    UNION ALL
    SELECT
        18, 'LT', 'Lithuania', 'EUR', 'Euro'
    UNION ALL
    SELECT
        19, 'LU', 'Luxembourg', 'EUR', 'Euro'
    UNION ALL
    SELECT
        20, 'MT', 'Malta', 'EUR', 'Euro'
    UNION ALL
    SELECT
        21, 'MD', 'Moldova', 'MDL', 'Moldovan Leu'
    UNION ALL
    SELECT
        22, 'NL', 'Netherlands', 'EUR', 'Euro'
    UNION ALL
    SELECT
        23, 'NO', 'Norway', 'NOK', 'Norwegian Krone'
    UNION ALL
    SELECT
        24, 'PL', 'Poland', 'PLN', 'Polish Zloty'
    UNION ALL
    SELECT
        25, 'PT', 'Portugal', 'EUR', 'Euro'
    UNION ALL
    SELECT
        26, 'RO', 'Romania', 'RON', 'Romanian Leu'
    UNION ALL
    SELECT
        27, 'RU', 'Russia', 'RUB', 'Russian Ruble'
    UNION ALL
    SELECT
        28, 'RS', 'Serbia', 'RSD', 'Serbian Dinar'
    UNION ALL
    SELECT
        29, 'SK', 'Slovakia', 'SKK', 'Slovak Koruna'
    UNION ALL
    SELECT
        30, 'SI', 'Slovenia', 'EUR', 'Euro'
    UNION ALL
    SELECT
        31, 'ES', 'Spain', 'EUR', 'Euro'
    UNION ALL
    SELECT
        32, 'SE', 'Sweden', 'SEK', 'Swedish Krona'
    UNION ALL
    SELECT
        33, 'CH', 'Switzerland', 'CHF', 'Swiss Franc'
    UNION ALL
    SELECT
        34, 'UA', 'Ukraine', 'UAH', 'Ukrainian Hryvnia'
    UNION ALL
    SELECT
        35, 'GB', 'United Kingdom', 'GBP', 'Pound Sterling'
)

SELECT
    country_key,
    country_code,
    country_name,
    currency_code,
    currency_name
FROM country_data
