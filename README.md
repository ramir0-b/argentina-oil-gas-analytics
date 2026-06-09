# Argentina Oil & Gas Analytics

Data analysis project based on Argentina's oil and gas production dataset published by the Secretariat of Energy.

## Project Overview

The goal of this project is to explore, understand, and analyze oil and gas production data at the well level.

Current work focuses on:

* Dataset exploration
* Data quality assessment
* Variable documentation
* Understanding the structure and granularity of the data

## Dataset

**Producción de Pozos de Gas y Petróleo**

The dataset contains monthly production records for oil, gas, water, and injection activities, along with information about wells, companies, provinces, and sedimentary basins.

### Initial Findings

* 328,917 records
* 83,083 unique wells
* Monthly production granularity
* No duplicate records for `(idpozo, anio, mes)`

## Repository Structure

```text
argentina-oil-gas-analytics/

├── data/
├── notebooks/
├── src/
├── docs/
└── README.md
```

## Data Source

Production data is provided by the Secretariat of Energy of Argentina.

http://datos.energia.gob.ar/dataset/produccion-de-petroleo-y-gas-por-pozo

Variable descriptions used in the documentation were adapted and translated from the official dataset documentation:

https://github.com/datosenergia/produccion-de-petroleo-y-gas-por-pozo

## Data Availability

Raw datasets are not included in this repository due to their size.

Data can be obtained from the official public sources provided by the Secretariat of Energy of Argentina.
