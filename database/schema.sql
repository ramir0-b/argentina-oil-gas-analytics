CREATE TABLE oil_gas_production (
    idempresa TEXT,
    anio INTEGER,
    mes INTEGER,
    idpozo BIGINT,

    prod_pet DOUBLE PRECISION,
    prod_gas DOUBLE PRECISION,
    prod_agua DOUBLE PRECISION,

    iny_agua DOUBLE PRECISION,
    iny_gas DOUBLE PRECISION,
    iny_co2 DOUBLE PRECISION,
    iny_otro DOUBLE PRECISION,

    tef DOUBLE PRECISION,
    vida_util DOUBLE PRECISION,

    tipoextraccion TEXT,
    tipoestado TEXT,
    tipopozo TEXT,

    fechaingreso TIMESTAMP,

    empresa TEXT,
    sigla TEXT,

    formprod TEXT,
    profundidad DOUBLE PRECISION,
    formacion TEXT,

    idareapermisoconcesion TEXT,
    areapermisoconcesion TEXT,

    idareayacimiento TEXT,
    areayacimiento TEXT,

    cuenca TEXT,
    provincia TEXT,

    tipo_de_recurso TEXT,
    proyecto TEXT,

    clasificacion TEXT,
    subclasificacion TEXT,
    sub_tipo_recurso TEXT,

    fecha_data DATE
);