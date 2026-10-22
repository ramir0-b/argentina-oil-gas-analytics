---------------------------
-- ## Validation ##

SELECT COUNT(*)
FROM oil_gas_production;

--

SELECT COUNT(DISTINCT idpozo)
FROM oil_gas_production;

--

SELECT MIN(fecha_data),
       MAX(fecha_data)
FROM oil_gas_production;


---------------------------
-- ## Province Analysis ##

SELECT
    provincia,
    SUM(prod_pet) AS total_oil
FROM oil_gas_production
GROUP BY provincia
ORDER BY total_oil DESC;

--

SELECT
    provincia,
    SUM(prod_gas) AS total_gas
FROM oil_gas_production
GROUP BY provincia
ORDER BY total_gas DESC;

-- Market share by province

SELECT
    provincia,
    ROUND(
        (100.0 * SUM(prod_pet)
        / SUM(SUM(prod_pet)) OVER ()
        )::numeric,
        2
    ) AS oil_share_pct
FROM oil_gas_production
GROUP BY provincia
ORDER BY oil_share_pct DESC;

--

SELECT
    provincia,
    ROUND(
        (100.0 * SUM(prod_gas)
        / SUM(SUM(prod_gas)) OVER ()
        )::numeric,
        2
    ) AS gas_share_pct
FROM oil_gas_production
GROUP BY provincia
ORDER BY gas_share_pct DESC;

---------------------------
-- ## Company Analysis ##

SELECT
    empresa,
    SUM(prod_pet) AS total_oil
FROM oil_gas_production
GROUP BY empresa
ORDER BY total_oil DESC
LIMIT 10;

--

SELECT
    empresa,
    SUM(prod_gas) AS total_gas
FROM oil_gas_production
GROUP BY empresa
ORDER BY total_gas DESC
LIMIT 10;

-- Market share by company

SELECT
    empresa,
    ROUND(
        (100.0 * SUM(prod_pet)
            / SUM(SUM(prod_pet)) OVER ()
        )::numeric,
        2
    ) AS oil_market_share_pct
FROM oil_gas_production
GROUP BY empresa
ORDER BY oil_market_share_pct DESC
LIMIT 10;

--

SELECT
    empresa,
    ROUND(
        (
            100.0 * SUM(prod_gas)
            / SUM(SUM(prod_gas)) OVER ()
        )::numeric,
        2
    ) AS gas_market_share_pct
FROM oil_gas_production
GROUP BY empresa
ORDER BY gas_market_share_pct DESC
LIMIT 10;

-- Companies offshore production

SELECT
    empresa,
    SUM(prod_gas) AS offshore_gas
FROM oil_gas_production
WHERE provincia = 'Estado Nacional'
GROUP BY empresa
ORDER BY offshore_gas DESC;

---------------------------
-- ## Basin Analysis ##

-- Market share by basin

SELECT
    cuenca,
    ROUND(
        (100.0 * SUM(prod_pet)
        / SUM(SUM(prod_pet)) OVER ()
        )::numeric,
        2
    ) AS oil_share_pct
FROM oil_gas_production
GROUP BY cuenca
ORDER BY oil_share_pct DESC;

--

SELECT
    cuenca,
    ROUND(
        (100.0 * SUM(prod_gas)
        / SUM(SUM(prod_gas)) OVER ()
        )::numeric,
        2
    ) AS gas_share_pct
FROM oil_gas_production
GROUP BY cuenca
ORDER BY gas_share_pct DESC;

-- Production by basin

SELECT
    cuenca,
    SUM(prod_pet) AS total_oil
FROM oil_gas_production
GROUP BY cuenca
ORDER BY total_oil DESC;

--

SELECT
    cuenca,
    SUM(prod_gas) AS total_gas
FROM oil_gas_production
GROUP BY cuenca
ORDER BY total_gas DESC;

---------------------------
-- ## Offshore Analysis ##

SELECT
    SUM(prod_pet) AS offshore_oil,
    SUM(prod_gas) AS offshore_gas
FROM oil_gas_production
WHERE provincia = 'Estado Nacional';

-- Offshore market share

SELECT
    ROUND(
        (100.0 * SUM(
            CASE
                WHEN provincia = 'Estado Nacional'
                THEN prod_gas
                ELSE 0
            END
        )
        / SUM(prod_gas)
        )::numeric,
        2
    ) AS offshore_gas_pct
FROM oil_gas_production;

-- Offshore vs. onshore comparison

SELECT
    CASE
        WHEN provincia = 'Estado Nacional'
        THEN 'Offshore'
        ELSE 'Onshore'
    END AS operation_type,

    SUM(prod_pet) AS total_oil,
    SUM(prod_gas) AS total_gas

FROM oil_gas_production
GROUP BY operation_type;

--

SELECT
    CASE
        WHEN provincia = 'Estado Nacional'
        THEN 'Offshore'
        ELSE 'Onshore'
    END AS operation_type,

    ROUND(
        (100.0 * SUM(prod_pet)
        / SUM(SUM(prod_pet)) OVER ()
        )::numeric,
        2
    ) AS oil_share_pct,
    ROUND(
        (100.0 * SUM(prod_gas)
        / SUM(SUM(prod_gas)) OVER ()
        )::numeric,
        2
    ) AS gas_share_pct

FROM oil_gas_production
GROUP BY operation_type;

---------------------------
-- ## Time Analysis ##

SELECT
    fecha_data,
    SUM(prod_pet) AS total_oil
FROM oil_gas_production
GROUP BY fecha_data
ORDER BY fecha_data;

--

SELECT
    fecha_data,
    SUM(prod_gas) AS total_gas
FROM oil_gas_production
GROUP BY fecha_data
ORDER BY fecha_data;

---------------------------
-- ## Rankings ##

-- Oil

SELECT
    empresa,
    SUM(prod_pet) AS total_oil,
    RANK() OVER (
        ORDER BY SUM(prod_pet) DESC
    ) AS ranking
FROM oil_gas_production
GROUP BY empresa;

-- Gas

SELECT
    empresa,
    SUM(prod_gas) AS total_gas,
    DENSE_RANK() OVER (
        ORDER BY SUM(prod_gas) DESC
    ) AS ranking
FROM oil_gas_production
GROUP BY empresa;

-- Oil market share 

SELECT
    empresa,
    SUM(prod_pet) AS total_oil,

    ROUND(
        (100.0 * SUM(prod_pet)
        / SUM(SUM(prod_pet)) OVER ())::numeric,
        2
    ) AS market_share_pct

FROM oil_gas_production
GROUP BY empresa
ORDER BY total_oil DESC;

-- Oil market share (CTE)

WITH company_share AS (
    SELECT
        empresa,
        SUM(prod_pet) AS total_oil,

        ROUND(
            (100.0 * SUM(prod_pet)
            / SUM(SUM(prod_pet)) OVER ())::numeric,
            2
        ) AS market_share_pct

    FROM oil_gas_production
    GROUP BY empresa
)

SELECT *
FROM company_share
ORDER BY market_share_pct DESC;

-- Cumulative oil market share (CTE)

WITH company_share AS (
    SELECT
        empresa,

        ROUND(
            (100.0 * SUM(prod_pet)
            / SUM(SUM(prod_pet)) OVER ())::numeric,
            2
        ) AS market_share_pct

    FROM oil_gas_production
    GROUP BY empresa
)

SELECT
    empresa,
    market_share_pct,

    SUM(market_share_pct)
    OVER (
        ORDER BY market_share_pct DESC
    ) AS cumulative_share

FROM company_share
ORDER BY market_share_pct DESC;