-- Top oil-producing provinces

SELECT
    provincia,
    SUM(prod_pet) AS total_oil
FROM production
GROUP BY provincia
ORDER BY total_oil DESC;

-- Top gas producing companies

SELECT
    empresa,
    SUM(prod_gas) AS total_gas
FROM oil_gas_production
GROUP BY empresa
ORDER BY total_gas DESC;

-- Monthly oil production

SELECT
    fecha_data,
    SUM(prod_pet) AS total_oil
FROM oil_gas_production
GROUP BY fecha_data
ORDER BY fecha_data;