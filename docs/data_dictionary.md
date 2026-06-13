# Data Dictionary

**Variable descriptions used in the documentation were adapted and translated from the official dataset documentation (in Spanish):**
*https://github.com/datosenergia/produccion-de-petroleo-y-gas-por-pozo*

## Variable descriptions

**idempresa** (string): *Identifier of the company operating the well*

**anio** (integer): *Reported Year*

**mes** (integer): *Reported Month*

**idpozo** (integer): *Well identifier by productive formation*

**prod_pet** (number): *Oil production (in m3)*

**prod_gas** (number): *Gas production (in thousands of m3)*

**prod_agua** (number): *Water production (in m3)*

**iny_agua** (number): *Water injection (in m3)*

**iny_gas** (number): *Gas injection (in thousands of m3)*

**iny_co2** (number): *CO2 injection (in thousands of m3)*

**iny_otro** (number): *Injection of other products (in m3)*

**tef** (number): *Effective well operating time*

**vida_util** (number): *Estimated useful life of the well*

**tipoextraccion** (string): *Type of fluid extraction from the well*

**tipoestado** (string): *Well status*

**tipopozo** (string): *Well operating characteristics*

**observaciones** (string): *Observations*

**fechaingreso** (date-time): *Data upload date*

**rectificado** (boolean): *The data was corrected by the operator*

**habilitado** (boolean): *Registration enabled for publication*

**idusuario** (integer): *User identifier for data upload*

**empresa** (string): *Name of the operating company*

**sigla** (string): *Unique identifier of the wellhead*

**formprod** (string): *Producing formation identifier*

**profundidad** (number): *Well depth*

**formacion** (string): *Producing formation*

**idareapermisoconcesion** (string): *Area, permit, or concession identifier*

**areapermisoconcesion** (string): *Area, permit, or concession name*

**idareayacimiento** (string): *Field identifier*

**areayacimiento** (string): *Field name*

**cuenca** (string): *Sedimentary basin name*

**provincia** (string): *Name of the province*

**tipo_de_recurso** (string): *Resource type*

**proyecto** (string): *Name of the project associated with the well*

**clasificacion** (string): *Well classification*

**subclasificacion** (string): *Well subclassification*

**sub_tipo_recurso** (string): *Type of hydrocarbon resource*

## Variable Categories

### Production Metrics
- prod_pet
- prod_gas
- prod_agua

### Injection Metrics
- iny_agua
- iny_gas
- iny_co2
- iny_otro

### Temporal Information
- anio
- mes
- fechaingreso
- fecha_data

### Geographic Information
- provincia
- cuenca
- idareayacimiento
- areayacimiento
- idareapermisoconcesion
- areapermisoconcesion

### Well Characteristics
- idpozo
- sigla
- profundidad
- vida_util
- tipoextraccion
- tipoestado
- tipopozo
- formacion
- formprod

### Company Information
- idempresa
- empresa

### Resource Classification
- tipo_de_recurso
- clasificacion
- subclasificacion
- sub_tipo_recurso

### Project Information
- proyecto

### Administrative Metadata
- habilitado
- rectificado
- idusuario
- observaciones