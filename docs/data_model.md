# Data Model
fact_production
      │
      ▼
dim_well
      │
      ├── dim_company
      ├── dim_province
      ├── dim_basin
      └── dim_resource

## Granularity
One record per well per month.

## Fact Table
### fact_production
- idpozo
- anio
- mes
- prod_pet
- prod_gas
- prod_agua
- iny_agua
- iny_gas
- iny_co2
- iny_otro
- tef

## Dimensions
### dim_well
- idpozo
- sigla
- profundidad
- vida_util
- tipopozo
- tipoestado
- tipoextraccion
- formacion
- formprod
- idareayacimiento
- areayacimiento
- idareapermisoconcesion
- areapermisoconcesion
- proyecto

### dim_company
- idempresa
- empresa

### dim_province
- provincia

### dim_basin
- cuenca

### dim_resource
- tipo_de_recurso
- clasificacion
- subclasificacion
- sub_tipo_recurso


## Scope
This analytical model includes the attributes considered most relevant for the use cases in this project.

Administrative and publication-related metadata were intentionally excluded.